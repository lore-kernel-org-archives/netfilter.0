From: Fred Richards <Toril@twcny.rr.com>
Subject: Re: How do you specify an odd group of hosts?
Date: Thu, 13 Jun 2002 16:31:34 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D090126.1050509@twcny.rr.com>
References: <7cc8c8300a.8300a7cc8c@uts.edu.au> <200206131638.RAA08412@slate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

This is what I did ... write a script!  You could have several parts, 
one for accepted hosts, etc... I actually had certain ports that I had a 
bunch of eggdrops allowed access on... listed the rules for the ports 
and added the IPs to the first line ...

for i in a.b.c.d  e.f.g.h  i.j.k.l
do
iptables -A inet-in -s $i  -j ACCEPT
done



Antony Stone wrote:

>On Thursday 16 May 2002 12:12 am, Adrian Hobbs wrote:
>
>  
>
>>I am wondering what is the best way to specify an odd group of hosts. For
>>example, I want to allow managment hosts access to 192.168.0.5. The
>>managment hosts are 192.168.1.4, 192.168.1.12, 192.168.1.96.
>>
>>eg:
>>iptables -A FORWARD -p tcp -d 192.168.0.5 --dport 22 -j MNG_HOST
>>
>>iptables -A MNG_HOST -s 192.168.1.4 -j ACCEPT
>>iptables -A MNG_HOST -s 192.168.1.12 -j ACCEPT
>>iptables -A MNG_HOST -s 192.168.1.96 -j ACCEPT
>>iptables -A MNG_HOST -j DENY
>>    
>>
>
>Looks like the best way of doing it to me.   There's no way to specify 
>multiple source or destination addresses in a single iptables rule except for 
>the contiguous network ranges you've already found in the docs.
>
> 
>
>Antony.
>
>
>  
>




