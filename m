From: fetchnob@nobarrier.co.za
Subject: traffic shaping and netfilters
Date: Thu, 17 Oct 2002 16:06:33 +0200 (SAST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2296.196.35.22.18.1034863593.squirrel@www.nobarrier.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.samba.org

Hi there all

can some help me with the correct syntax to shape traffic.

I have a machine with 4 network cards

eth0 = internet
eth1 = my network
eth2 = dmz
eth3 = some clients

I would like to know 2 things

1 the syntax to shape all traffic to the internet for the following
      http = 60% burstable 100%
      mail = 20% burstable 100%
      other = 20% burstable 100%
2 the syntax to do shape a ipaddress to the internet to a percent of the line
       10.1.1.1 = 50% burstable 100%
       10.1.1.2 = 50% burstable 100%



______________________________________
Mail has been scanned and protected by No Barrier Communications
www.nobarrier.co.za

