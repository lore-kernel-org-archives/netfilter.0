From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Can iptables create alias IP for another box?
Date: Tue, 24 Dec 2002 17:20:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKCEMFLLAA.rsterenborg@xs4all.nl>
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
Content-Type: text/plain; charset="us-ascii"
To: Paul <andnicky@myrealbox.com>, netfilter@lists.netfilter.org

> No joy yet.
>
> Have new box B w/fully updated RH 7.3.  Uninstalled
> ipchains so iptables could run.  Added rules shown below
> with 8080 changed to 80.  Rules are visible in iptables -L -v.
>
> But when I sniff the client attempting to browse
> http://10.5.6.7 from same subnet, it's issuing SYNs with no
> reply. Same whether httpd is up/down on 10.5.6.7.  Client
> can ping both B and A no problem.
>
> Should netstat -an show listening on 80?  Am I missing a

If httpd is running on port 80 : yes.
If you're checking port 80 on B then it depends if your config is
correct.
In my situation, when portforwarding failes, nmap says "filtered",
otherwise "open".
I wouldn't use netstat to check. Use nmap to test host A from host B,
do not test host A from host A (or B from B). Always use another host
to check.
If the client is running linux, check host B from the client with
nmap.
Now we're at it : do you want to use iptables or a webcache (you're
talking about that..) ?

> fundamental setting that determines whether linux will
> forward packets at all?  This box has an eth1 that's

You do have "echo 1 > /proc/sys/net/ipv4/ip_forward" ?
You could log what's happening using LOG rules, something like :
iptables -I FORWARD 1 -j LOG --log-prefix "FWD-check: "

> down...would it help to remove it?  Or connect it?!

I think using 2 nics would be better as each can have it's own
subnet...
To get a better picture, how are they connected right now ?

-----------     ------------
| Host A  |     | Host B   |
| 1.2.3.4 |     | 10.5.6.7 |
-----------     ------------
      |               |
      -----------------------....
            |
        ----------
        | Client |
        ----------

Or like this ?

----------------                ------------
| Host B       |                | Host A   |
|  eth1 ?.?.?.?|-----------     | 10.5.6.7 |
|eth0 10.5.6.7 |          |     |          |
----------------          |     ------------
      |                   |           |
      ----------....      ------------------....
            |
        ----------
        | Client |
        ----------


Rob


