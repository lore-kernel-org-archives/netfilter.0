From: "Paul J. Caritj" <pcaritj@riovia.net>
Subject: Re: Redirecting Traffic Locally
Date: Tue, 28 Oct 2003 20:36:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9F19B2.4040801@riovia.net>
References: <008a01c39dbb$60b51070$2288e7c0@promed.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008a01c39dbb$60b51070$2288e7c0@promed.com.au>
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

No dice, thanks for the tip though.

If it helps, here is my entire setup:

iptables -t nat -F PREROUTING;
iptables -t mangle -F PREROUTING;
iptables -t nat -F UNREGISTERED;
iptables -t nat -I UNREGISTERED -s 192.168.1.7 -d 0/0 -j ACCEPT;
iptables -t nat -I UNREGISTERED -s 0/0 -d 192.168.1.7 -j ACCEPT;
iptables -t nat -I UNREGISTERED -s 10.0.0.1 -d 0/0 -j ACCEPT;
iptables -t nat -I UNREGISTERED -s 0/0 -d 10.0.0.1 -j ACCEPT;
iptables -t nat -I UNREGISTERED -s www.riovia.net -d 0/0 -j ACCEPT;
iptables -t nat -I UNREGISTERED -s 0/0 -d www.riovia.net -j ACCEPT;
iptables -t nat -I UNREGISTERED -s www.riovia.com -d 0/0 -j ACCEPT;
iptables -t nat -I UNREGISTERED -s 0/0 -d www.riovia.com -j ACCEPT;
iptables -t nat -A UNREGISTERED -p tcp -s 0/0 -d 0/0 -j DNAT 
--to-destination 10.0.0.1;
iptables -t nat -I PREROUTING -d 0/0 -s 0/0 -j UNREGISTERED;

Stuart J. Browne wrote:

>>-----Original Message-----
>>From: netfilter-admin@lists.netfilter.org 
>>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Paul 
>>J. Caritj
>>Sent: Wednesday, 29 October 2003 11:01
>>To: netfilter@lists.netfilter.org
>>Subject: Redirecting Traffic Locally
>>
>>
>>Gents,
>>Hopefully this is an easy question :)
>>
>>I have a firewall with a built in webserver. I want all traffic going 
>>through this firewall, not to (or from) a proscribed list of IPs to be 
>>redirected to the Site hosted on the firewall itself (its a signup 
>>page). At present, I'm using redirection of this form:
>>
>>iptables -t nat -A UNREGISTERED -s 0/0 -d 0/0 -j DNAT --to-destination 
>>XXXXXXX;
>>    
>>
>
>Have you tried using 'REDIERCT' instead of 'DNAT' ?
>
>iptables -t nat -A UNREGISTERED -j REDIRECT --to <localport>
>
>  
>
>>A rule in the PREROUTING chain bounces traffic to the UNREGISTERED 
>>chain. The system works fine when XXXXXXX is outside the network. 
>>However, I cannot DNAT to the firewall itself. Thoughts, anyone?
>>    
>>
>
>Stuart
>
>
>
>.
>
>  
>



