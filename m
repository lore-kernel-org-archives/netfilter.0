From: "Aldo Lagana" <alagana@discmail.com>
Subject: RE: more fun with squid
Date: Fri, 9 May 2003 16:58:15 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305092100.h49L0OlN007128@discmail.com>
References: <ABEKJILKOKKGGDJKHKDFOEPICAAA.patrick@vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ABEKJILKOKKGGDJKHKDFOEPICAAA.patrick@vikus.com>
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
To: 'Patrick Ahler' <patrick@vikus.com>, 'netfilter EMAIL' <netfilter@lists.netfilter.org>

 Google for Transparent Proxying with Squid....there are tons of writeups
and that is what you want...there is only one iptables rule required but
there are a few configs for squid in squid.conf


> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> Patrick Ahler
> Sent: Friday, May 09, 2003 3:49 PM
> To: netfilter EMAIL
> 
> Ok, I got squid working great behind my firewall even set it 
> up so IE would autodetect it. What I would rather do though 
> is have netfilter/the firewall
> server(192.168.1.a) forward any http packets from my network 
> 192.168.1.0 to the proxy server on 192.168.1.b and then out 
> to the internet through the firewall(192.168.1.a). That way 
> the proxy would be transparent to the users'
> browsers and no autodetection would be required. Not sure how 
> to setup these rules, or if this is even the most efficient 
> way of accomplishing the task.
> Also, I don't know if it makes a difference... but the 
> firewall runs NAT tables.
> 
> So, in other words, this is what I'd like to do...
> (user)192.168.1.c 
> --->(firewall)192.168.1.a--->(squid/proxy)192.168.1.b--->(
> firewall)192.168.1.a
> 
> Thanks in advance,
> -Patrick
> 
> 
> 


