From: Michael <mutk@iprimus.com.au>
Subject: Re: Red Hat 7.3 and your script
Date: Thu, 05 Sep 2002 21:19:18 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D773DB6.6060008@iprimus.com.au>
References: <F35Xeg7tj2WAPZ50n1J0002e13c@hotmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: IPtables Users <netfilter@lists.samba.org>

You don't save the iptables script in /etc/sysconfig...
Redhat has a feature to save iptables current settings. It saves those 
setting in /etc/sysconfig   . It is a particular format, and is not a 
shell script of any description.

Here is what to do (With your script saved in a file called 
"firewallscript":

As root,
chmod +x firewallscript
./firewallscript
service iptables save

Cheers,
Michael


Gustavo Marrero wrote:

> Dear iptables guru:
>
> My name is Gus. I am currently attempting to switch from ipchains 
> (came with red hat) to iptables. I copied your script
> http://www.sentry.net/~obsid/IPTables/rc.scripts.dir/current/ (dual-home)
> and saved it in:
> /etc/sysconfig
> modified it to my ip addresses and locations.
> For some reason or another I just cannot hit (after 10's of hours of 
> research) why it is not working.
> (ps. I am running the dual-homed firewall).
> This is what I get when booting. I did disable ipchains etc. I get the 
> error for what ever I place in the first line of the script.Your help 
> will greatly be appreciated.
>
> Bad argument `IPTABLES="/sbin/iptables'
> Try `iptables-restore -h' or 'iptables-restore --help' for more 
> information.
>                                                           [FAILED]
>
> Please let me know if there is anything else I can do. Thanks a million.
>
> Gus
>
> _________________________________________________________________
> Send and receive Hotmail on your mobile device: http://mobile.msn.com
>
>
>




