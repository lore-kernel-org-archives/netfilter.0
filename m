From: Madhav Diwan <madhav@diwancomputing.com>
Subject: where did ipt_unclean go in kernel 2.6.5 ?
Date: Tue, 06 Apr 2004 17:45:06 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <407324E2.5080408@diwancomputing.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
To: netfilter@lists.netfilter.org, mvdiwan@hotmail.com

Hi Everyone,

I recently compiled and applied kernel 2.6.5 from kernel.org , building 
it as an rpm using `make rpm` on a RedHat 9 system. The build process 
went so smoothly i was astonished.

Of course there are always the little nagging things left to clean up.

Just curious but where did the unclean match target disappear to? I 
thought that was part of the base iptables target set.

I use firestarter to apply iptables rule sets to this upgraded machine 
and I see the following:


Apr  6 17:31:31 shreya1 firestarter: Zeroing all current rules: succeeded
Apr  6 17:31:31 shreya1 modprobe: FATAL: Module ipt_unclean not found.
Apr  6 17:31:32 shreya1 last message repeated 2 times
Apr  6 17:31:32 shreya1 firestarter: Applying Firestarter configuration 
succeeded

Was UNCLEAN dropped as a standard target? I don t see it anywhere in the 
standard kernel config in the 2.6 series.

patchomatic-ng was no help either.


By the way , as a side note, just which iptables patches DO apply to the 
kernel 2.6 series? its at version 2.6.5 now and severely needs some 
firewalling support. , for instance h323 and the failover connection 
tracking?

Sincerely

Madhav Diwan

