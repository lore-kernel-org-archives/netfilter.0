From: Goetz Bock <netfilter@blacknet.de>
Subject: Re: firewalled dns clients
Date: Fri, 7 Nov 2003 11:24:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031107102425.GE11702@shell.blacknet.de>
References: <F22386C3FEB012449238672E38ED61E706C26A@overlord.overturemedia.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <F22386C3FEB012449238672E38ED61E706C26A@overlord.overturemedia.com>
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
Content-Transfer-Encoding: 7bit
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>


On Fri, Nov 07 '03 at 11:49, Fritz Mesedilla wrote:
> From their windows workstation, I want to be able to let them perform a nslookup.
> 
> I tried this and nothing happened.
> $IPTABLES -A INPUT -p tcp --sport 53 -j ACCEPT
> even a
> $IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT
nslookup/dns needs udp, too. And you must use the FORWARD chain if you
don't run the dns server on the firewall.

What about having a look at the rules produced by some of the
firewall generation scripts. e.g. fireHOL. (-> firehol.sf.net)
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]

