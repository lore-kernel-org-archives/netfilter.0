From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: NFS Client/Server Firewall.
Date: Sun, 23 Nov 2003 19:28:50 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FC150C2.3010501@Loudoun-Fairfax.com>
References: <E870E2C2-1E00-11D8-94DF-0003934F91C0@mac.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E870E2C2-1E00-11D8-94DF-0003934F91C0@mac.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: netfilter@lists.netfilter.org

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body text="#000000" bgcolor="#ffffff">
Vincent Mortellaro wrote:<br>
<blockquote type="cite"
 cite="midE870E2C2-1E00-11D8-94DF-0003934F91C0@mac.com">Hi,
  <br>
  <br>
I recently tried setting up an NFS server in my LAN and I've already
nailed down the necessary ports so that lockd, statd, rquota and mountd
now occupied ports 4000-4003. I did the same thing with clients just in
case it would be necessary for running iptables there too. I setup
iptables on the server using suse's yast tool, and then editing their
susefirewall2 script to allow these ports: 2049, 111, 4000:4003 and the
server worked fine - all of my clients could access it. However, when I
went to firewall my clients (again using yast to configure iptables
with the same ports) I couldn't connect to my server. Instead it gave
an error message of "RPC: Timed Out".
  <br>
</blockquote>
<br>
I had some issues running NFS on a SuSE server through iptables a while
back. A few things you might try:<br>
<br>
1. Make sure you have udp and tcp port 111 and udp 2049 open. My
configuration doesn't seem to need the 4000-4003 ports.<br>
<br>
2. Tale a look in your /var/log/messages file and see if you are
getting any other errors from either iptables or the kernel itself.
Usually this error is secondary to another problem.<br>
<br>
3. Make sure statd is running on both the clients and the server. YaST2
doesn't seem to know which supporting services you need and won't start
them automatically.<br>
<blockquote type="cite"
 cite="midE870E2C2-1E00-11D8-94DF-0003934F91C0@mac.com"><br>
I'd be more than happy writting my own iptables ruleset however I'm
unsure as to what needs to be allowed by default for linux to work
thats why I used yast to just add-in the parts I thought I needed. If
anyone could give any advise about what I'm doing wrong or how I could
setup iptables myself with rules that would protect both my nfs/samba
server and my normal clients I'd appreciate it greatly.
  <br>
</blockquote>
<br>
Ultimately it's best to write your own script. YaST2 is a very good
tool to configure most services (better in my opinion than the Redhat
tools) but it is terrible for iptables. I'm sure the default script is
very good (it's enormous and even I don't know what they're doing in
some sections) but the gui configuration options are far too broad and
ambiguous to be useful.<br>
<br>
That said, writing your own script requires a fairly good understanding
of iptables commands and how netfilter works. It takes some time and
you really want to practice on an unimportant system before letting
your scripts loose on a production network. I'd recommend trying to get
the YaST2 configuration working first, then you have time to learn to
use iptables the right way. If you do decide to write your own script
start by reading Oskar's tutorial:<br>
<br>
<a class="moz-txt-link-freetext" href="http://iptables-tutorial.frozentux.net/">http://iptables-tutorial.frozentux.net/</a><br>
<br>
Good luck and let me know how it goes.<br>
<br>
Jeff<br>
<br>
<br>
</body>
</html>


