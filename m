From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: iptable: obtaining list of tables?
Date: Fri, 26 Feb 2010 15:24:06 +0100
Message-ID: <4B87D986.5040006@chello.at>
References: <4B86EDE6.8000302@gatworks.com> <Pine.GSO.4.64.1002252214190.21439@mail.time-domain.co.uk> <4B870BA0.7030706@gatworks.com> <C7232BDB534C6241BE85C96D129205D002F40F7BFD@BLRINMSMBX01.bglrodc.lntinfotech.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <C7232BDB534C6241BE85C96D129205D002F40F7BFD@BLRINMSMBX01.bglrodc.lntinfotech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 26.02.2010 14:14, Karthik Venkateswaran wrote:
> I agree with you George, atleast it seems there is no mechanism to list the tables.
> 
> Apologies for my ignorance, but could you tell me the reason why you would need to list the tables. As far as I know netfilter provides a static list of tables - filter, mangle & nat.

no, that's not quite right.
In the early days iptables had mangle, nat and filter tables.
Then the raw table was introduced to circumvent connection tracking.
Now we also have the security table for SELinux context, hocked right
after the filter table.
And there is the rawpost table, available if you install the
xtables-addons (used for RAWSNAT and RAWDNAT - static nat without
connection tracking).

If the kernel was built with the tables compiled as modules, you can
load/unload them. i.e output of lsmod:
ip_tables               7551  6
iptable_security,iptable_nat,iptable_mangle,iptable_raw,iptable_filter,iptable_rawpost

Usually the currently active tables are listed in:
/proc/net/ip_tables_names
This list is empty until you load the modules.

But there is no way afaik to tell what tables are supported without
knowing their names and try to load them.

Best regards

Mart


> -----Original Message-----
> From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of U. George
> Sent: Thursday, February 25, 2010 6:46 PM
> To: andy thomas
> Cc: netfilter@vger.kernel.org
> Subject: Re: iptable: obtaining list of tables?
> 
> As far as I can tell - no. Docs says it just list chains. sample try,
> suggests that only the default table is used to list a -t "" .
> 
> BTW: if u dont use -L -n, the chain is silently ignored - ;-(
> 
[...]
