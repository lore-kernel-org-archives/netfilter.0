From: Michael <freeware@adsl-209-204-165-151.sonic.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local
 machine to another
Date: Sun, 29 Jun 2003 19:22:13 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFF9ED5.9070808@adsl-209-204-165-151.sonic.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net> <20030630020152.GA27602@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------010606070902080000070908"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030630020152.GA27602@cannon.eng.us.uu.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.
--------------010606070902080000070908
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

What would you like me to confirm? That it's broken? It is broken. That 
the RST sending port is not the same as the initiating SYN port? It is 
not; it's low, just above 1024, so I assumed it to be 
netfilter-generated, whereas the Squid port was in the 30000 range. That 
my rule set isn't sending it? "I have no reject-with-tcp-reset lines in 
my tables." Don't know what else you could mean.

Ramin Dousti wrote:

>>I have a configuration, so:
>>
>>/------------\ .0.2     .{0,1}.1 /----------\ 1.2.3.4  (          )
>>| Web server |-----+-------------| firewall |---------(  Internet  )
>>\------------/     |        eth0 |  Squid   | eth1     (          )
>>                   |             \----------/
>>/---------\ .1.2   |
>>| browser |--------/
>>\---------/
>>
>>- The 192.168.{0,1}. subnets run on the same wire.
>>- Port 80 on the public i/f is DNATed to the internal Web server.
>>
>>The firewall is running Squid to proxy for 192.168.1. clients, and it 
>>works fine *except* when the target server resolves to a public IP on 
>>eth1.  When that happens, I see the client-to-Squid communication go OK, 
>>then Squid send a SYN (from .0.1) to .0.2:80, .0.2 sends a SYN ACK,... 
>>but then netfilter spontaneously issues a RST to .0.2:80 from another 
>>port (i.e., not the one that Squid was using)!
>>    
>>
>
>No idea why this RST is being sent (might have to do with your rule set or
>more possibly the internals of squid) but the fact that you say the RST
>sending port is not the same as the initiating SYN port should not break
>anything. Can you confirm this?
>
>Ramin
>
>  
>
>>I have no reject-with-tcp-reset lines in my tables.
>>

--------------010606070902080000070908
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
What would you like me to confirm? That it's broken? It is broken. That
the RST sending port is not the same as the initiating SYN port? It is
not; it's low, just above 1024, so I assumed it to be
netfilter-generated, whereas the Squid port was in the 30000 range.
That my rule set isn't sending it? "I have no reject-with-tcp-reset
lines in my tables." Don't know what else you could mean.<br>
<br>
Ramin Dousti wrote:<br>
<blockquote type="cite"
 cite="mid20030630020152.GA27602@cannon.eng.us.uu.net">
  <blockquote type="cite">
    <pre wrap="">I have a configuration, so:

/------------\ .0.2     .{0,1}.1 /----------\ 1.2.3.4  (          )
| Web server |-----+-------------| firewall |---------(  Internet  )
\------------/     |        eth0 |  Squid   | eth1     (          )
                   |             \----------/
/---------\ .1.2   |
| browser |--------/
\---------/

- The 192.168.{0,1}. subnets run on the same wire.
- Port 80 on the public i/f is DNATed to the internal Web server.

The firewall is running Squid to proxy for 192.168.1. clients, and it 
works fine *except* when the target server resolves to a public IP on 
eth1.  When that happens, I see the client-to-Squid communication go OK, 
then Squid send a SYN (from .0.1) to .0.2:80, .0.2 sends a SYN ACK,... 
but then netfilter spontaneously issues a RST to .0.2:80 from another 
port (i.e., not the one that Squid was using)!
    </pre>
  </blockquote>
  <pre wrap=""><!---->
No idea why this RST is being sent (might have to do with your rule set or
more possibly the internals of squid) but the fact that you say the RST
sending port is not the same as the initiating SYN port should not break
anything. Can you confirm this?

Ramin

  </pre>
  <blockquote type="cite">
    <pre wrap="">I have no reject-with-tcp-reset lines in my tables.</pre>
  </blockquote>
</blockquote>
</body>
</html>

--------------010606070902080000070908--


