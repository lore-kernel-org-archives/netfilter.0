From: Thomas Lussnig <lussnig@smcc.net>
Subject: Re: secure ftp with SSL
Date: Fri, 13 Sep 2002 12:20:54 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D81BC06.80107@smcc.net>
References: <754E53EEA7D3D31194E50050DAB99F6E70543C@thor.id.magnus.com>
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
To: Rendy V <RendyV@atd.magnus.co.id>
Cc: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>

Rendy V wrote:

> Hi All,
> I have a strange problem, the problem is like this :
> I have an application that use secure ftp and for that reason I have 
> opened up the command port (990) with state NEW and allowed data port 
> (20000:20049) with state ESTABLISHED, RELATED on the firewall. It 
> fails when it try to use data port, for authentication it working just 
> fine. Please see the log on the below.
>
> If I open data port 2000:20049 with state NEW it working normally but 
> I don't want to make a big hole on my firewall. I suspect that the 
> iptables connection tracking cannot track the relation between command 
> port and data port because it is encrypted using SSL. Is it true or is 
> there something I miss here?? What should I do now??
>
The problem you have is that on SSL crypted connection the RELATED could 
not work right. Because for FTP there is an extra module that analyse the
control traffic and can so evalute what ports are related. But this is 
not posible then the traffic is unreadable for the module.

Cu Thomas




