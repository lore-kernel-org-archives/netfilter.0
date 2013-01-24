From: David Gubler <dg@doodle.com>
Subject: connlimit reached - cannot open connections even after I close some
Date: Thu, 24 Jan 2013 15:22:13 +0100
Message-ID: <51014395.1000101@doodle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list,

I want to solve a seemingly simple problem: Limit the number of TCP 
connections coming from a single IP address to a web server on port 
8080. (background: we had some misbehaving clients eating up a lot of 
server resources by opening 400 parallel connections from a single IP - 
that number is unreasonnable even for proxy servers, so I want to 
enforce a limit)

This sounds like a case for connlimit, so this is what I did (max 4 
connections for easier testing):

iptables -A INPUT -p tcp --syn --dport 8080 -m connlimit 
--connlimit-above 4 -j REJECT

Fetching files with wget --limit-rate=1 shows that this works... sort of.

The fifth connection fails as expected, but after I kill some of the 
other connections (verified with netstat -anp | grep ESTABLISHED), I 
*still* cannot open new connections!

To be able to connect again, I have to cease *any* connect attempts for 
about two minutes. If I repeatedly try to connect, I'm not able to 
connect ever again (!), even when there are no more established connections.

As far as I can tell, the problem is the way connlimit works: It looks 
at the conntrack table and considers all entries there, even the 
SYN_WAIT ones (the ones that have been rejected by connlimit end up in 
that state). Or to put it differently: If connlimit denies a connection, 
that connection will *still* create a conntrack entry and thus will also 
count against the connection limit. This can be verified using the 
"conntrack -L" command.

This behaviour makes this simple setup completely unusable for us, 
because if some IP accidentally hits the limit I want that IP to be able 
to connect again as soon as it is back below the limit. Think well 
behaving NATs or proxy servers: They might have a very short burst which 
goes over the limit, so I want to block them for a few seconds, but 
after that things should immediately go back to normal.

After some research I came up with the following:

In addition to the connlimit rule above, I added

iptables -A PREROUTING -t raw -p tcp --dport 8080 -m connlimit 
--connlimit-above 4 -j NOTRACK
iptables -A OUTPUT -t raw -p tcp --sport 8080 -m connlimit 
--connlimit-above 4 -j NOTRACK

This prevents conntrack table entries from being created for connections 
that are over the limit.

But:

* Does this really do what I think it does (i.e. do you think this is 
safe for production)?
* It looks like there is a race condition: Some other connection could 
get closed between the NOTRACK and the REJECT rule. Result: A new 
connection would not get a conntrack entry because it is over the limit 
at first, but later would not be rejected because it is now under the 
limit. Could that be an issue?
* Is this a bug in connlimit?
* Am I missing something else (e.g. an undocumented parameter for 
connlimit)?

Thanks!

David

-- 
David Gubler
Senior Software & Operations Engineer
MeetMe: http://doodle.com/david
E-Mail: dg@doodle.com
