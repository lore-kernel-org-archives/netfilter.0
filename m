From: "Linux User" <linux_user_78@hotmail.com>
Subject: forward traffic web to squid server
Date: Wed, 12 Feb 2003 17:24:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F83liatzHAC7h6gU2vL00027cec@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org

Hi friends,

In my server RedHat-8.0, I have installed script-firewall with iptables,=20
this firewall-server has connection to Internet and the users of the=20
internal network correctly work, now my restlessness is in which I have=20
installed a squid server in the internal network but that simultaneously=20
this connected by another network to a server with line ADSL to Internet, m=
y=20
question is as I can configure my firewall to forward all traffic web to my=
=20
squid server that this in the internal network?

__________
|Internet |
|         |
|_________|
    |
    |
___|____200.37.245.159
|Server |
|with   |
| ADSL  |
|_______|192.168.105.1
   |
   |
__|____
|Squid  |192.168.105.2
|Server |
|_______|
   |192.168.100.254
   |
   |___________________________INTERNAL NETWORK
___|_____
|Firewall|192.168.100.1
|Server  |___________________________INTERNET
|_______ |

I can configure my firewall to forward all traffic web to my squid server=20
that this in the internal network?


THANKS
Joseph


_________________________________________________________________
Charla con tus amigos en l=EDnea mediante MSN Messenger:=20
http://messenger.yupimsn.com/


