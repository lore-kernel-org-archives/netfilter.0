From: "Bobi Ruzinov" <bobirose40@hotmail.com>
Subject: Multiple IPs on a server - Interesting problem
Date: Mon, 09 Dec 2002 15:00:04 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F174b8vq3UhQCAIx06w00001394@hotmail.com>
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

I have a server with 35 IPs assigned to eth0. I want to have incoming 
connections from a single IP limited to only one IP on the server at a time. 
For example if someone connects to any port on 1.2.3.4 he/she should not be 
able to connect to any other IP on the server until he/she has any open 
connections to 1.2.3.4. Once all the connections to 1.2.3.4 are closed the 
client could connect to another IP.

I need this so that if someone scans port 21 on a whole range of IPs it will 
not start 35 new connections (instances) of Xinetd and/or Ftpd. Any ideas?

Thanks.

Bobi Rose


_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963


