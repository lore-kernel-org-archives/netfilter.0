From: "Don Hughes" <support@sannotes.org>
Subject: Compile error
Date: Sat, 24 Jul 2004 11:55:18 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41024E26.19563.4B6804@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Content-description: Mail message body
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

I am trying to recompile iptables under SuSE 9.1 
to add the time module and get the following when 
issuing a make:

In file included from 
/usr/src/linux/include/linux/netfilter_ipv4.h:11,
                 from 
/usr/src/linux/include/linux/netfilter_ipv4/ip_tab
les.h:25,
                 from include/libiptc/libiptc.h:6,
                 from include/iptables.h:5,
                 from extensions/libipt_ah.c:8:
/usr/src/linux/include/net/protocol.h:39: warning: 
`struct sk_buff' declared inside parameter list
/usr/src/linux/include/net/protocol.h:39: warning: 
its scope is only this definition or declaration, 
which is probably not what you want
/usr/src/linux/include/net/protocol.h:40: error: 
parse error before "u32"
/usr/src/linux/include/net/protocol.h:40: warning: 
`struct sk_buff' declared inside parameter list
/usr/src/linux/include/net/protocol.h:48: warning: 
`struct sk_buff' declared inside parameter list
/usr/src/linux/include/net/protocol.h:53: warning: 
`struct inet6_skb_parm' declared inside parameter 
list
/usr/src/linux/include/net/protocol.h:53: warning: 
`struct sk_buff' declared inside parameter list
/usr/src/linux/include/net/protocol.h:63: error: 
field `list' has incomplete type
make: *** [extensions/libipt_ah_sh.o] Error 1


I have spent 3 weeks trying to resolve this with 
no luck.  Any help would be appreciated.



..don

support@microtechniques.com
White Plains, NY



