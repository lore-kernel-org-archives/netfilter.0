From: Michael Gale <michael.gale@utilitran.com>
Subject: Packet dumping or mirroring
Date: Wed, 18 Feb 2004 13:54:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040218135436.309837c7@mgalepc.utilitran.com>
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
To: netfilter@lists.netfilter.org

Hello,

	I have a question, well more of a idea ... let me know what you think. This is
not only a netfilter question but would require netfilter to work so ...

I use a program called Ntop to monitor network traffic ... I have it running all
the time and dump the data nightly to a mysql DB via a PHP script and then reset
the stats. 

This allows me to provide data on a day, week and month bases, anyways ... from
my understanding most programs like Ntop have a issue with keeping up with
traffic that is faster then 100MB HD.

So anything 10MB FD and slower is ok, but anything over that limit ntop can not
keep up with the flow so your monitoring stats do not reflect the actually
amount. 

Now I supposed I could switch programs and try IPFM or something but there out
sucks. 

So I have the following idea / solution involving iptables :)

Solution 1:
First you create a "tmpfs" .. for example in your NTOP home directory call it
tmp (/home/ntop/tmp). Now make this directory a RAM drive that gets mount
everytime we boot up, about 50MB (maybe).

or 

Solution 2:

Create a new deice, like a dummy network.

Now we create a module for iptables to send a copy of every packet on every
interface to the RAM drive or dummy device.

I think a RAM drive is better, so if we have a firewall box with two interfaces
we could have iptables send a copy of every packet in raw form to the RAM drive.
Each packet or group of packets could be labelled by interface plus time
timestamp plus transaction ID or checksum ? You could have different mod levels
like only dump packet headers or whole packets ?

This would insure that not network packets are lost and the monitor could keep
up.

We could not have our monitoring program (ntop for example) read the packets in
the RAM drive every <not sure> and provide reporting stats. This would also
allow us to save funny looking packets for investigating.

What do you think ... I do not believe there is a way to do this now :(

-- 
Michael Gale
Network Administrator
Utilitran Corporation

