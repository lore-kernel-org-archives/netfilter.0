From: "Don Hughes" <dhughes@microtechniques.com>
Subject: Re: Newby
Date: Mon, 27 Dec 2004 15:32:36 -0500
Message-ID: <41D02B14.6647.F61F81@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Description: Mail message body
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

On Monday 27 December 2004 09:03, calvin@dslextreme.com wrote:
Thanks to Jason, Kassad and Askar for responding to my email. 
I've only played with RedHat before, and mostly forced myself to 
use command line than the GUI interface. Maybe its time to try 
other Linux flavor. Now, this FW I want to setup for my home 
network, I would like the least software loaded on this as this 
is a 32MB, PII 266, 2.5GB computer. I am thinking IPTABLES, 
Tripwire, SNORT, or will that be too much for this machine ? 
Related to this, where can I find information of those required
to load during OS installation for these 3 apps to work.

I know that SuSE has a minimal installation option that will 
easily fit on your drive. Without the gui 266 should be more than 
fast enough since your internet connection will be the slowest 
link. RAM could be tight though. SuSE offers a text based 
installation for PCs with RAM/Video limits. You can select the 
minimal installation option then hand pick any other files you 
wish to add/delete. It uses RPM packages so it will check for 
dependencies 
before it loads files. Worth a look...


I used to run the SuSE text based system on a similar system 
without any problem.  I used the SuSE YAST2 installer, deleted 
everything, added back IPTABLES, Tripwire, SNORT, rsync, and my 
favorite editor and had it solve dependencies.  With all the 
libraries/utilities/etc it installed about 170 RPM packages.  
Excluding swap and temp space, it took about 600Meg of disk 
space.



-- 
..don

dhughes@microtechniques.com
White Plains, NY

