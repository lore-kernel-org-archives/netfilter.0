From: "Pedro Luis D. L." <carcadiz@hotmail.com>
Subject: Kernel Hangs after hook registration
Date: Mon, 09 Jul 2007 14:40:23 +0200
Message-ID: <BAY122-F1175820D7FB4F1883760D8CA060@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi everybody,

I'm developing an audio sink in an ethernet rtp stream communication using =

an embedded platform. For this purpose I had to write an I2S driver to send=
=20
the sound info to an external amplifier. In order to decrease the memory an=
d=20
CPU usage I'm planning to use a hook to intercept the RTP stream and copy i=
t=20
directly to the I2S driver.
The I2S driver registers an audio device under ALSA.
Right now the hook is not implemented and I'm using a small example that=20
intercepts a packet and if it's a RTP packet
The problem I've found when I modify the I2S driver to include the hook=20
registration is that the system hangs and can not be recovered once the hoo=
k=20
is registered. However, if I try to register the hook on a separated module=
=20
it works fine, so it's not a problem of the hook function (always returns=20
NF_ACCEPT).
For some design requirements, implementing the hook and the I2S audio drive=
r=20
together is encouraged.
I thought that it could be a problem of initialization or something so I=20
compiled alsa as a module, but it has the same behaviour.

Anybody has a clue why this hang may happen?

I'm using a 2.6.16 kernel for an MPC5200 platform.

Thanks in advance.

Pedro L. Dom=EDnguez

_________________________________________________________________
=BFEst=E1s pensando en cambiar de coche? Todas los modelos de serie y extra=
s en=20
MSN Motor. http://motor.msn.es/researchcentre/


