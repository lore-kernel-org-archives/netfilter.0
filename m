From: Chris Poupart <cpoupart@canada.com>
Subject: Tunneling FTP over SSH through an IPTables NAT/Filter setup...
Date: Tue, 22 Oct 2002 09:27:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DB55231.6050802@canada.com>
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
To: netfilter <netfilter@lists.netfilter.org>

I am trying to tunnel FTP over SSH, as it sais in the subject, using 
Dreamweaver MX as the FTP client and PuTTY as the SSH client.

I believe what this setup does by default is to send the FTP commands 
via the SSH tunnel, but then to return information and send data through 
another port (the FTP client defaults to Passive when I tell Dreamweaver 
to tunnel through SSH.)

Because the command strings are sent through SSH, the ftp_conntrack 
module will not work to recognize the other connections are RELATED or 
ESTABLISHED.

What I end up with is a connection, through which I can not browse the 
remote directories, nor upload or download files.  FTP by itself works fine.

The rules are pretty simple.  Defaut drop policies, followed by standard 
MASQ rules, and then INPUT rules that only allow RELATED or ESTABLISHED 
rules back in.  There are no OUPUT rules for the moment.

I tried allowing all connections from the FTP server back through, but I 
am not sure if I wrote the rule correctly.

The funny thing is, if I use the SSH client from SSH.com, they have an 
"FTP" mode for tunneling, and that works fine with my setup.  I guess 
that it has some built in connection tracking itself?

Any help would be much appreciated.

-- Chris


