From: Pascal Vilarem <pascal.vilarem@9online.fr>
Subject: Re: iptables newbie
Date: Thu, 11 Sep 2003 16:28:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F608679.4010508@9online.fr>
References: <20030911134133.91316.qmail@web20711.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030911134133.91316.qmail@web20711.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

you could have run the equivalent iptables command lines of each line in 
order to
find the wrong one by yourself :-(

for your problem, try to write the last line using -m parameter:
-A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to-port 3128

or check your RH-Lokkit-0-50-INPUT definition.

hope this can help,
Pascal.


ads nat wrote:

> Hi,
> I have Linux REDHAT 8.0 server. Iptables are installed while 
> installing Linux 8.0. version 1.2.6a
>  
> I am getting following error.
>  
> [root@xyz root]# /etc/init.d/iptables restart
> Flushing all current rules and user defined chains:        [  OK  ]
> Clearing all current rules and user defined chains:        [  OK  ]
> Applying iptables firewall rules: iptables-restore v1.2.6a: Unknown 
> arg `--dport'
> Try `iptables-restore -h' or 'iptables-restore --help' for more 
> information.
>                                                            [FAILED]
>  
> In iptables file i have used  :
> *filter
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 0:1023 --syn -j REJECT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 2049 --syn -j REJECT
> -A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 0:1023 -j REJECT
> -A RH-Lokkit-0-50-INPUT -p udp -m udp --dport 2049 -j REJECT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 6000:6009 --syn -j REJECT
> -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --dport 7100 --syn -j REJECT
> COMMIT
> *nat
> -A PREROUTING -p TCP --dport 80 -j REDIRECT --to-port 3128
> COMMIT
>  
> Do i have to install any additional module.
> Thanks
>
>  
> ------------------------------------------------------------------------
> Do you Yahoo!?
> Yahoo! SiteBuilder 
> <http://us.rd.yahoo.com/evt=10469/*http://sitebuilder.yahoo.com> - 
> Free, easy-to-use web site design software 



