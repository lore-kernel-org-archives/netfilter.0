From: =?UTF-8?B?0JLQsNGB0LjQu9C40Lkg0KHQstC40YDQuNC00L7Qsg==?=
 <netspider@mail.ru>
Subject: Re: Fedora Core 2. Port Forwarding Problems
Date: Sat, 24 Jul 2004 13:12:19 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4102C2A3.5090007@mail.ru>
References: <4101D6BD.8040904@mail.ru> <200407241555.16611.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------040501080308080900000001"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241555.16611.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------040501080308080900000001
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

Antony Stone wrote:

>On Saturday 24 July 2004 4:25 am, Василий Свиридов wrote:
>
>  
>
>>I've installed fedora core 2 and tried to reuse my old settings i
>>retained from redhat9 system.
>>
>>Masqeurading works fine, but when i try to do port forwarding like this
>>iptables -t nat -A PREROUTING -p tcp -d <domainname.com> --dport 80 -j
>>DNAT --to 192.168.20.40:80
>>rule adds itself fine, but port 80 is not accessible from outside.
>>    
>>
>
>Are you sure about the resolving of domainname.com?   What does the rule get 
>added as?
>  
>
It simply resolves the address and adds the IP.

>  
>
>>when i try to connect from outside it doesn't say connection refused, it
>>dies after a timeout.
>>/proc/net/ip_conntrack doesn't show any presence of connection, I tried
>>to send it to -j LOG & ULOG but both end up empty.
>>    
>>
>
>Please show us your ruleset.   We would like to see:
> - what IP address the above PREROUTING rule gets installed with
> - the corresponding FORWARD rule for the packets
> - an appropriate reply packet rule
> - how you have been LOGging packets for testing
>
>I suggest the output of "iptables -L -nvx; iptables -L -t nat -nvx" and if 
>appropriate also "iptables -L -t mangle -nvx" is a good format for us to 
>understand where you're starting from.
>
>Regards,
>
>Antony.
>
>  
>
iptables -L -nvx doesn't contain any rules yet.

[root@border root]# iptables -L -t nat -nvx
Chain PREROUTING (policy ACCEPT 5913 packets, 353422 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
       8      408 DNAT       tcp  --  *      *       
0.0.0.0/0            207.6.196.64        tcp dpt:80 to:192.168.20.40:80

Chain POSTROUTING (policy ACCEPT 4 packets, 244 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
     744    42337 MASQUERADE  all  --  *      eth0    
0.0.0.0/0            0.0.0.0/0
      11      588 SNAT       tcp  --  *      *       
0.0.0.0/0            192.168.20.40       ctstate DNAT tcp dpt:80 
to:207.6.196.64

Chain OUTPUT (policy ACCEPT 123 packets, 7641 bytes)
    pkts      bytes target     prot opt in     out     
source               destination
       3      180 DNAT       tcp  --  *      *       
0.0.0.0/0            207.6.196.64        tcp dpt:80 to:192.168.20.40:80

This kind of configuration worked just fine on RH9. But it wasn't 
working on it when I've tried to install kernel 2.6.6.

Thanks.

--------------040501080308080900000001
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=UTF-8" http-equiv="Content-Type">
  <title></title>
</head>
<body>
Antony Stone wrote:<br>
<blockquote cite="mid200407241555.16611.Antony@Soft-Solutions.co.uk"
 type="cite">
  <pre wrap="">On Saturday 24 July 2004 4:25 am, Василий Свиридов wrote:

  </pre>
  <blockquote type="cite">
    <pre wrap="">I've installed fedora core 2 and tried to reuse my old settings i
retained from redhat9 system.

Masqeurading works fine, but when i try to do port forwarding like this
iptables -t nat -A PREROUTING -p tcp -d &lt;domainname.com&gt; --dport 80 -j
DNAT --to 192.168.20.40:80
rule adds itself fine, but port 80 is not accessible from outside.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Are you sure about the resolving of domainname.com?   What does the rule get 
added as?
  </pre>
</blockquote>
It simply resolves the address and adds the IP.<br>
<blockquote cite="mid200407241555.16611.Antony@Soft-Solutions.co.uk"
 type="cite">
  <pre wrap="">
  </pre>
  <blockquote type="cite">
    <pre wrap="">when i try to connect from outside it doesn't say connection refused, it
dies after a timeout.
/proc/net/ip_conntrack doesn't show any presence of connection, I tried
to send it to -j LOG &amp; ULOG but both end up empty.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
Please show us your ruleset.   We would like to see:
 - what IP address the above PREROUTING rule gets installed with
 - the corresponding FORWARD rule for the packets
 - an appropriate reply packet rule
 - how you have been LOGging packets for testing

I suggest the output of "iptables -L -nvx; iptables -L -t nat -nvx" and if 
appropriate also "iptables -L -t mangle -nvx" is a good format for us to 
understand where you're starting from.

Regards,

Antony.

  </pre>
</blockquote>
iptables -L -nvx doesn't contain any rules yet.<br>
<br>
<tt>[root@border root]# iptables -L -t nat -nvx<br>
Chain PREROUTING (policy ACCEPT 5913 packets, 353422 bytes)<br>
    pkts      bytes target     prot opt in     out    
source               destination<br>
       8      408 DNAT       tcp  --  *      *      
0.0.0.0/0            207.6.196.64        tcp dpt:80 to:192.168.20.40:80<br>
<br>
Chain POSTROUTING (policy ACCEPT 4 packets, 244 bytes)<br>
    pkts      bytes target     prot opt in     out    
source               destination<br>
     744    42337 MASQUERADE  all  --  *      eth0   
0.0.0.0/0            0.0.0.0/0<br>
      11      588 SNAT       tcp  --  *      *      
0.0.0.0/0            192.168.20.40       ctstate DNAT tcp dpt:80
to:207.6.196.64<br>
<br>
Chain OUTPUT (policy ACCEPT 123 packets, 7641 bytes)<br>
    pkts      bytes target     prot opt in     out    
source               destination<br>
       3      180 DNAT       tcp  --  *      *      
0.0.0.0/0            207.6.196.64        tcp dpt:80 to:192.168.20.40:80</tt><br>
<br>
This kind of configuration worked just fine on RH9. But it wasn't
working on it when I've tried to install kernel 2.6.6.<br>
<br>
Thanks.<br>
</body>
</html>

--------------040501080308080900000001--

