From: Rudi Starcevic <tech@wildcash.com>
Subject: Iptables Network Performance
Date: Wed, 23 Feb 2005 17:24:30 -0800
Message-ID: <421D2CCE.50702@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

Could iptables really reduce network speed by more than 50%.

It is hard to believe but that seems to be my predicament right now.

For this test I have a 12 meg file.

When I download this from my Linux box is get a download speed of 47.23K/s

When I move this 12 meg file to an internal web server and port-forward
to it from the Linux box I see a download rate of 11.70K/s

Does this sound reasonable?

If I move my Port-forwarding rule higher up woudld it help?

Thanks
Regards
Rudi      


-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.300 / Virus Database: 266.4.0 - Release Date: 22/02/2005


