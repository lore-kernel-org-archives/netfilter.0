From: ads nat <adsnat@yahoo.com>
Subject: Re: iptables-restore help
Date: Sun, 28 Sep 2003 07:20:53 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030928142053.94035.qmail@web20710.mail.yahoo.com>
References: <20030928091802.5218.qmail@web20705.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030928091802.5218.qmail@web20705.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>, Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

I got it.
command to save iptables rule to
/etc/sysconfig/iptables for Redhat 8.0 is
"/sbin/service iptables save"

Thanks

--- ads nat <adsnat@yahoo.com> wrote:
> Please guide me how to do this otherwise.
> Thanks.
> 
> Daniel Chemko <dchemko@smgtec.com> wrote:
> iptables doesn't inherently save state data. Redhat
> 8.0 might do something along those lines, but if you
> are really trying to play with the iptables rules,
> it is probably best to disable the redhat stuff and
> build your own startup / shutdown scripts so that
> you really know what is going on under the hood.
> 
> ads nat wrote:
> Hi,
> I am learning to use iptables.
> I have gone through FAQ and tutorials but have two
> problems :
>  
> 1) I can create rules, delete rules, save rules with
> "iptables-save" command. But can not use
> "iptables-restore" properly. my iptables file is in
> at /etc/sysconfig/iptables
> I am using Redhat Linux 8.0, iptables 1.2.6a
> version.
>  
> Whatever rule I have saved goes off when i reboot
> system. As I have understood after using
> "iptables-restore" command, it should save rules in
> /etc/sysconfig/iptables file. So that when system
> reboots automatically it will be implimented.
>  
> 2) I have set rule "iptables -A INPUT -i eth0 -m
> state --state NEW -m limit --limit 1 -j LOG" so that
> i can go through logs of NEW users tryong to connect
> to server. These are saved in which file? 
> Help appreciated.
>  
> Thanks 
> 
>  
>  
> 
> ---------------------------------
> Do you Yahoo!?
> The New Yahoo! Shopping - with improved product
> search 
> 
> ---------------------------------
> Do you Yahoo!?
> The New Yahoo! Shopping - with improved product
search


__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

