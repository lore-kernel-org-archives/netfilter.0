From: "Shannon J. Field" <shannon.field@backbonesecurity.com>
Subject: U32 trouble
Date: Thu, 17 Jun 2004 16:56:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4807CA09ACACCF4BBDACF1EF2455D8B3AB8DD4@bbserver3.backbonesecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I've been playing around with the u32 extention, and I have come across =
a problem. I was trying to block an http get request, for example GET =
/search*/ where search is a wild card.=20

Now if I did: iptables -A OUTPUT -m u32 --u32 "0>>22&0x3C@12>>26&0x3C@ =
0=3D0x47455420 && 0>>22&0x3C@12>>26&0x3C@ 4=3D0x2F736561 && =
0>>22&0x3C@12>>26&0x3C@ 8&0xFFFFFF00=3D0x72636800 && =
0>>22&0x3C@12>>26&0x3C@ 10&0xFFFF=3D0x2F20" -j REJECT


I get this error: iptables v1.2.9: u32: at char 106 error reading number

which points at the 8 in this part: "8&0xFFFFFF00=3D0x72636800"

Now from what I have read, I see no reason this shouldn't work.  I tried =
a similar looking line in William Stearns tutorial: iptables -m u32 =
--u32 "12&0xFFFFFF00=3D0xC0A80F00"

Which gives the same error: iptables v1.2.9: u32: at char 3 error =
reading number.

What is the problem here? Is it me, or my version of the u32 module? I =
am running iptables2.9, and used POM 20031219 to patch the kernel with =
the u32 module.

Thanks for your help.
-Shannon

