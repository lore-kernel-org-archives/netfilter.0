From: Rahul Jadhav <rjadhav@iatp.org>
Subject: protection from nmap scans!
Date: Thu, 21 Nov 2002 10:37:03 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDD0BAF.70707@iatp.org>
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
To: netfilter@lists.netfilter.org

Hi!
I was testing my firewall this morning using nmap.
A scan of all unprivileged ports with ping turned off, crashed my firewall.
I'd like to know how to detect the following scan.
   nmap -P0 -p 1024-65535 <ip address>
Thanks,
Rahul



