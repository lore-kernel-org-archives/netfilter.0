From: Tom Smith <tom@openadventures.org>
Subject: Re: Port Forwarding Problem
Date: Tue, 25 Feb 2003 14:53:19 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E5BE5CF.70007@openadventures.org>
References: <3E5BB0BF.2070401@openadventures.org> <20030225201418.GA1099@tekilla.homeip.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------090309050605010506010309"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030225201418.GA1099@tekilla.homeip.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org, wdyck@gmx.net


--------------090309050605010506010309
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Found the problem...the GATEWAY on 20.246 was set to a different router 
and not the firewall.

It started working after I changed it--thanks for your help!!!

Willi Dyck wrote:

>On Tue, Feb 25, 2003 at 11:06:55AM -0700, Tom Smith wrote:
>  
>
>>Having problem forwarding 216.161.174.4 port 8241 to 192.168.20.246 port 22.
>>
>>I added the following rule to run DNAT:
>>$IPTABLES -t nat -A PREROUTING -p tcp -d 216.161.174.4 --dport 8241 -j 
>>DNAT --to-destination 192.168.20.246:22
>>    
>>
>
>Good.
>
>  
>
>>What I saw when trying to connect to the port from a remote host was:
>>uccinet kernel: IN=eth1 OUT=eth0 SRC=64.158.129.226 DST=192.168.20.246 
>>LEN=60 TOS=0x10 PREC=0x00 TTL=45 ID=63685 DF PROTO=TCP SPT=2030 DPT=22 
>>WINDOW=5840 RES=0x00 SYN URGP=0
>>
>>I later learned that I also needed some FORWARD rules to make it work. 
>>The default script had most of them. I added:
>>$IPTABLES -A FORWARD -d 192.168.20.246 -p tcp --dport 22 -j ACCEPT
>>    
>>
>
>Better. Much better would be a second rule which allows the way back
>from 192.168.20.246.
>
>$IPTABLES -A FORWARD -s 192.168.20.246 -p tcp --sport 22 -j ACCEPT
>
>What I see in your 'iptables -nL' output is that you allow everything
>in the FORWARD chain which has a state ESTABLISHED and/or RELATED, thus
>the second rule above isn't necessery. Does 192.168.20.246 have routing
>entry back to the inet? Also, what is the output of 'iptables -nvL
>FORWARD'?
>
>  
>
>>Chain FORWARD (policy DROP)
>>target     prot opt source               destination         
>>ACCEPT     tcp  --  0.0.0.0/0            192.168.20.246     tcp dpt:22 
>>ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
>>ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
>>drop-and-log-it  all  --  0.0.0.0/0            0.0.0.0/0          
>>    
>>
>
>Regards -- Willi
>
>  
>

--------------090309050605010506010309
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
Found the problem...the GATEWAY on 20.246 was set to a different router
and not the firewall.<br>
<br>
It started working after I changed it--thanks for your help!!!<br>
<br>
Willi Dyck wrote:<br>
<blockquote type="cite"
 cite="mid20030225201418.GA1099@tekilla.homeip.net">
  <pre wrap="">On Tue, Feb 25, 2003 at 11:06:55AM -0700, Tom Smith wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Having problem forwarding 216.161.174.4 port 8241 to 192.168.20.246 port 22.

I added the following rule to run DNAT:
$IPTABLES -t nat -A PREROUTING -p tcp -d 216.161.174.4 --dport 8241 -j 
DNAT --to-destination 192.168.20.246:22
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Good.

  </pre>
  <blockquote type="cite">
    <pre wrap="">What I saw when trying to connect to the port from a remote host was:
uccinet kernel: IN=eth1 OUT=eth0 SRC=64.158.129.226 DST=192.168.20.246 
LEN=60 TOS=0x10 PREC=0x00 TTL=45 ID=63685 DF PROTO=TCP SPT=2030 DPT=22 
WINDOW=5840 RES=0x00 SYN URGP=0

I later learned that I also needed some FORWARD rules to make it work. 
The default script had most of them. I added:
$IPTABLES -A FORWARD -d 192.168.20.246 -p tcp --dport 22 -j ACCEPT
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Better. Much better would be a second rule which allows the way back
from 192.168.20.246.

$IPTABLES -A FORWARD -s 192.168.20.246 -p tcp --sport 22 -j ACCEPT

What I see in your 'iptables -nL' output is that you allow everything
in the FORWARD chain which has a state ESTABLISHED and/or RELATED, thus
the second rule above isn't necessery. Does 192.168.20.246 have routing
entry back to the inet? Also, what is the output of 'iptables -nvL
FORWARD'?

  </pre>
  <blockquote type="cite">
    <pre wrap="">Chain FORWARD (policy DROP)
target     prot opt source               destination         
ACCEPT     tcp  --  0.0.0.0/0            192.168.20.246     tcp dpt:22 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          
drop-and-log-it  all  --  0.0.0.0/0            0.0.0.0/0          
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Regards -- Willi

  </pre>
</blockquote>
</body>
</html>

--------------090309050605010506010309--



