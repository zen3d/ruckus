uniform float zoom;
uniform float closeEnough;

void main() {
  vec3 pos = vec3(gl_FragCoord.xy - resolution.xy / 2., 0) / zoom;
    
  float d = (distanceField(pos) - ISOSURFACE) * zoom;
  if (d <= 0) {
    // Hit something!
    int nid = nearestNodeId(pos);
    if (d < -closeEnough) {
      // Internal surface.
      gl_FragColor = vec4(matColor(nid), 1);
    } else {
      // Edge.
      gl_FragColor = vec4(matColor(nid) * 0.5, 1);
    }
  } else {
    // Miss.
    gl_FragColor = vec4(1,1,1,1);
  }
}

