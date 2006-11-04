From: "Antonio Forster" <aforster@gmail.com>
Subject: LVS breaking ip_nat_ftp (??)
Date: Sat, 4 Nov 2006 14:01:30 -0300
Message-ID: <b0eb2070611040901j55c8c703gd4b6849f4af87ed0@mail.gmail.com>
References: <b0eb2070611040841w4fb1379ai68b16b99c1250a8a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <b0eb2070611040841w4fb1379ai68b16b99c1250a8a@mail.gmail.com>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello all,

I'm running a LVS (NAT) cluster with 4 real servers behind it, where
each of those real servers run 4 servers instances that create, in the
cluster, 4 groups as below:

Real Server1:  inst11, inst12, inst13, inst14
Real Server2:  inst21, inst22, inst23, inst24
Real Server3:  inst31, inst32, inst33, inst34
Real Server4:  inst41, inst42, inst43, inst44

In keepalived, we have the following virtual servers:

Virtual Server 1: inst11, inst21, inst31, inst41
Virtual Server 2: inst12, inst22, inst32, inst42
Virtual Server 3: inst13, inst23, inst33, inst43
Virtual Server 4: inst14, inst24, inst34, inst44

with such configuration, I have 4 virtual servers being server by 4
instances among the 4 real servers.

So far, so good and everything works fine. During certain periods, the
instances must initiate connections to the outer environment through
the directors for logs transfers and content management, and for that
to work correctly, I have implemented N:1 outbound NAT rules in the
directors so the instances could reach outside the cluster corrently
with their global IP addresses (the same configured in keepalived for
the virtual servers). And so far, so good too.

The problem arrives when the outbound connection is FTP. For some
strange reason, it more than one instance on that N:1 NAT is active,
it breaks ip_nat_ftp and the PORT command in the ftp session goes with
the real IP address of the instance, while if only one instance in
that virtual server is active, ip_nat_ftp works fine. An example:

1) everything up
- inst11, inst21, inst31 and inst41 (virtual server1 real servers) are active:
- inst11 starts an active ftp session through the director;
- ip_nat_ftp doesnt change the payload;
- the firewall (linux running netfilter) the lies between the director
and the internet blocks the connection;

2) Almost everything down
- inst 21, inst31, inst41 are down and only inst11 is active in
virtual server one;
- inst11 starts an active ftp session through the director;
- ip_nat_ftp works ok and change the ftp payload;
- the firewall (linux running netfilter) the lies between the director
and the internet permits the connection;

Some important information: all routing devices (directors and
internet firewalls) are running static 2.6.11 kernels with everything
in, including ip_conntract_ftp and ip_nat_ftp. We tried also with
modular kernels, and it works pretty the same.

Unfortunately we cannot use passive FTP due to security rules, so
active must be used. But we tested passive ftp sessions, and it works
ok though.

For some reason, it seems that ip_nat_ftp's behavior is being changed
by the LVS code, but I couldnt find why. I have also searched the net
for information on that, but everything that relates FTP with LVS is
for the opposite way, when the LVS service is a FTP server being load
balanced, and couldnt find anything where the real server in the
cluster wants to FTP to outside.

I know this question refers also to LVS code, but I thought I should
post it here since the problem seems to be on ip_nat_ftp.

Can anyone help on that?

Thanks in advance.

Antonio

