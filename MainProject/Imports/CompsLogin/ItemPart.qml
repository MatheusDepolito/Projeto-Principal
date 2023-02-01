import QtQuick 2.15
import QtQuick.Particles 2.15
import Cores 1.0

ParticleSystem {
  id: sys
  width: 150
  height: 300
  x: (parent.width - width) / 2
  y: (parent.height - height) / 2
  running: true
  Rectangle {
    id: background
    color: Cores.cor1
    width: 25
    height: width
    radius: width
    anchors.centerIn: parent
    z: -1
  }
  property real petalLength: 180
  property real petalRotation: 0

  NumberAnimation on petalRotation {
    from: 0
    to: 360
    loops: -1
    running: true
    duration: 24000
  }
  function convert(a) {
    return a * (Math.PI / 180)
  }
  Emitter {

    lifeSpan: 4000
    emitRate: 2000
    size: 8
    anchors.centerIn: parent
    onEmitParticles: particles => {
                       for (var i = 0; i < particles.length; i++) {
                         var particle = particles[i]
                         // particle.startSize = Math.max(02,Math.min(492,Math.tan(particle.t/2)*24));
                         var theta = Math.floor(Math.random() * 10.0)

                         theta /= 10.0
                         theta *= 2.0 * Math.PI
                         theta += sys.convert(
                           sys.petalRotation) //Convert from degrees to radians
                         particle.initialVX = sys.petalLength * Math.cos(theta)
                         particle.initialVY = sys.petalLength * Math.sin(theta)
                         particle.initialAX = particle.initialVX * -0.5
                         particle.initialAY = particle.initialVY * -0.5
                       }
                     }
  }
  ImageParticle {
    source: "qrc:///particleresources/star.png"
    color: "red"
    alpha: 0.0
  }
}
