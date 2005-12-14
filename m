From: Sudhakar Moharana <soodhakar@gmail.com>
Subject: help needed for RTSP conntrack module 2.4 kernel
Date: Wed, 14 Dec 2005 10:26:20 +0530
Message-ID: <6dbb1b230512132056m36f76f21kd2dd7e2dbc0fd91b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I'm running RTSP conntrack module in my application gateway ( uClinux
2.4.22 kernel, ARM processor).  The application gateway has one uplink
WAN port and eight LAN ports.  The devices on the LAN port are given
local IP address. The application gateway does NAT + PAT for  all the
outgoing traffic.

Now the problem is that sometimes  RTSP Client behind my gateway sends
two RTSP SETUP requests with same source port one after another. The
RTSP module in the gateway handles the first SETUP message correctly
while the second SETUP request does not get handled properly and the
local IP address of the RTSP client goes to the RTSP server on the
Network(i.e the local ip address and the port in SETUP message are not
getting mangled to the global IP address and global ports of the
gateway). Since the local IP addresses are not routed in the Network
so the RTSP client fails playing the stream.

How can I handle this situation where two SETUP message are sent
subsequently. Please note that  RTSP client needs only one connection
at one time.
Is there any way to  discard the connection tracking made for first
SETUP message and allow the same to be done for the second SETUP
message if the connection tuple remains the same.  I'm getting EBUSY
error for the second SETUP Message in ip_conntrack_expect_related
function.

Please suggest any other ideas to do the same.


Thanx & Regards,
Sudhakar


--
SUDHAKAR MOHARANA
Innomedia technologies pvt ltd.
#3278,12th main,100ft road,HAL 2nd stage,
indiaranagar,bangalore-8
ph :-(080)5278444,ext-142 (O)

