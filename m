From: "Randy Grimshaw" <rgrimsha@syr.edu>
Subject: Re: Rule to limit outbound packets?
Date: Fri, 10 Mar 2006 12:45:38 -0500
Message-ID: <s4117512.001@gwia201.syr.edu>
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
Content-Type: text/plain; charset="iso-8859-9"
To: efgonzalez@gmail.com, netfilter@lists.netfilter.org


>>> "Eduardo Fern=E1ndez" <efgonzalez@gmail.com> 3/9/2006 11:39:16 PM >>>
>Hi!

>I admin a linux router at a uni dorm, the internet link is adsl (low
>upstream bw) so I to write a rule that limits (mostly outbound) p2p
>traffic. I'm trying something like this:
>
>iptables -A FORWARD -m limit --limit 200/s --limit-burst 200 -p tcp
>--syn --dport 4662 -j ACCEPT
>iptables -A FORWARD -p tcp --syn --dport 4662 -j REJECT
>
>or
>
>iptables -A FORWARD -o $IFOUT -m limit --limit 100/s --limit-burst
>1000 -p tcp --syn --dport 4662 -j ACCEPT
>iptables -A FORWARD -o $IFOUT -p tcp --syn --dport 4662 -j REJECT
>
>but it doesn't seem to work. I can't use hashlimit because I only can
>use 2.4 (any patch to use hashlimit in 2.4?).
>
>Thanks a lot!
>
>Edu

These are some limit values that we use... (albiet a different application)=

 -m limit --limit 40/second --limit-burst 60 -j ...
 -m limit --limit 7/second --limit-burst 12 -j ...
perhaps your values are too high.

<><Randy


<><Randall Grimshaw
Room 203 Machinery Hall
Syracuse University
Syracuse, NY   13244
315-443-5779
rgrimsha@syr.edu


