From: "Osgaldo Suanzes" <osgaldo@tiscali.es>
Subject: Quota Patch (samj@samj.net)
Date: Tue, 15 Jul 2003 11:32:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004a01c34ab4$0e712290$040a0ac0@bajoran5qxlt73>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi.
Can someone explain me if I can use this Patch, If I want to
   assign a download quota( 20Mb) to my Server 192.168.0.2

Im not sure if this patch only allow to assign quotas by traffic type (icmp,
http...)
Can I assign quotas to an Ip Address? how must the rule look like?

    example?:  is this ok?

    # iptables -A INPUT -s 192.168.0.2  -m quota --quota 20000000 -j Accept
    # iptables -A INPUT -s 192.168.0.2  -j DROP



   I have heard there is another modified Quota Patch out there, but Im not
sure if
    it fits my needs.
http://www.ussg.iu.edu/hypermail/linux/net/0304.1/0002.html

    Any comments are very appreciate,.

    Thanks.
                    Osgaldo


