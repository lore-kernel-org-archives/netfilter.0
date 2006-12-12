From: Mike Williams <mike@v6.gaima.co.uk>
Subject: problem with (incorrectly?) INVALID packets
Date: Tue, 12 Dec 2006 19:42:19 +0000
Message-ID: <200612121942.19276.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hey,

I'm getting quite stuck with a problem of returning packets not being 
classified as ESTABLISHED or RELATED (when they get to LFW).
Below is an attempt at an diagram explaining the setup.

               |
            internet
               |
           81.1...4.217
           SDSL Router
           81.1...7.49
         (81.1...7.48/28)
               |        (90.1...1.64/27)
             switch           /
       ________/\_________   /
      |                   | /
  81.1...7.50        81.1...7.59
     BFW               bridge
  192.168.0.1        90.1...1.69
(192.168.0.0/24)          |
      |              90.1...1.67
                         LFW
                    192.168.136.1
                  (192.168.136.0/24)

In the above diagram 90.1...1.64/27 is routed by the SDSL router to 
81.1...7.59, as it can't support more than one range on it's "LAN" side.
The bridge has a rule for traffic from 90.1...1.64/27 to go via a default 
gateway of 81.1...7.49, as it can route to that.
Traffic can go in, out, and over LFW just fine.
To add a bit more difficultly, the interface on LFW with public IPs is also a 
bridge, some may remember my question about bridging and NATting, this is the 
machine which will be doing that.
When I ping things from LFW I get an ICMP redirect to 81.1...7.49, but I don't 
see anyway I can reach it directly from 90.1...1.67. This is however a minor 
annoyance.

The real problem is when you overlay VPNs onto that diagram (something I gave 
up trying to draw). There is a tunnel between 192.168.0.0/24 and 
192.168.136.0/24.
0.0/24 can do all the things they are supposed to be able to do to 136.0/24.
136.0/24 can do all they things they are supposed to be able to do against the 
internet.
136.0/24 however can't do anything to 0.0/24, as the packets coming back from 
0.0/24 get blocked by rules designed to stop non-authorised traffic being 
initiated from 0.0/24 to 136.0/24.

Pretty much the first rules I have say any ESTABLISHED or RELATED packets get 
accepted. Which should match these returning packets, and does on the 
more "normal" firewalls I run.
For some reason I have failed to fathom, all the returning packets that come 
in over any of the VPNs (there are 3), are INVALID not the ESTABLISHED or 
RELATED they should be.

Can anyone help?

Thanks

(I use fwbuilder to manage and generate my rules, as it has served me well for 
about 2 years)

-- 
Mike Williams

