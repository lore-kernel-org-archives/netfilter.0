From: "ArioS" <christian@wanxp.net>
Subject: bridge + transparent proxy
Date: Tue, 24 Aug 2004 15:53:31 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <010901c489b7$d54277a0$fd14a8c0@wanxpr3yianevq>
References: <09D3F703EF3B0A4CBE28449EA9F3D32069F456@nicta-atp-mail.in.nicta.com.au> <012801c4899d$bd5e9660$0100a8c0@newlife> <20040824073219.GA25002@tranquility.scriptkitchen.com> <018a01c489af$106ce2b0$0100a8c0@newlife>
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

hi all , i`m running linux kernel 2.4.20 with bridge installed (2 eth).. the
bridge works nice and i can block any traffic that i want
the problem is i can`t do tranparent proxy , i tried using

iptables -A PREROUTING -t nat -p tcp --dport 80 -j DNAT --to $myproxy:3128

and it didn`t work... my bridge didn`t get any incoming traffic from client
to port 80 or 3128....
is it because bridge only run in layer 1 or something else ? sorry for my
dumb question :)
any idea ?

Regards,


Kristian


