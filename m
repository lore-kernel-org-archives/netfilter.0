From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTABLES syntax problem.
Date: Tue, 23 Dec 2003 12:38:43 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231238.43412.Antony@Soft-Solutions.co.uk>
References: <001701c3c950$a50b6560$2d64a8c0@pcjka>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c3c950$a50b6560$2d64a8c0@pcjka>
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

On Tuesday 23 December 2003 12:31 pm, Jan Kaastrup wrote:

> What do you want to do with this rule?

Presumably the intention is to catch packets which are not part of an existing 
connection, but which are not SYN packets - eg FIN scans?

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of ads nat
> Sent: 23. december 2003 12:47
> To: netfilter@lists.netfilter.org
> Subject: IPTABLES syntax problem.
>
>
> Hi,
> I am trying to setup IPTABLES rules. I am newbe to
> this.
>
> One of the rule in filter table is
> #######
> -A INPUT -p tcp ! --syn -m state --state NEW -j LOG
> --log-prefix "New not syn:"
> #############
>
> I am getting following error :
>
>
> [root@allweb root]# /etc/init.d/iptables restart
> Flushing all current rules and user defined chains:
>     [  OK  ]
> Clearing all current rules and user defined chains:
>     [  OK  ]
> Applying iptables firewall rules: iptables-restore
> v1.2.6a: Unknown arg `--syn'
> Try `iptables-restore -h' or 'iptables-restore --help'
> for more information.
>
> I am using /etc/init.d/iptables restart to apply
> iptables rules.
>
> I think I have used proper syntax "--syn" from Oskar
> Anderson IPTABLES tutorials.
>
> Looking for support.
> Thanks
>
> __________________________________
> Do you Yahoo!?
> Protect your identity with Yahoo! Mail AddressGuard
> http://antispam.yahoo.com/whatsnewfree

-- 
This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.


