From: "Afshin Lamei" <linux_st@hotmail.com>
Subject: Doing Bridge with firewalling
Date: Tue, 31 Dec 2002 14:21:24 +0330
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F154kB47qXLFfJNwPmx00000ffb@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
I want to make my linux box perform both bridging and firewalling(I mean 
filternig,Nat,etc.)
My linux box has 2 ethernet cards.
1- Is it necessary to disable ip address of both eth0 and eth1? if yes, how 
to do that?
2- When I try to add eth0 as an interface to the bridge (using brctl addif), 
It says : "eth0:Setting promiscuous mode." what does it mean?
thanks,
--afshin







_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963


