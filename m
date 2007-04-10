From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: packets to local addresses
Date: Tue, 10 Apr 2007 18:20:41 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704101820030.21664@yvahk01.tjqt.qr>
References: <fad2fb270704060522r4322a223g4e2e40605b3fb6a@mail.gmail.com> 
	<46167157.3080409@rtij.nl>
	<fad2fb270704070713w37a73f82o3caaf14f987a0f7a@mail.gmail.com>
	<4617BC88.102@rtij.nl>
	<Pine.LNX.4.61.0704072040300.22181@yvahk01.tjqt.qr>
	<46180FAD.50209@rtij.nl>
	<fad2fb270704100452p74fdde26k33f7a666ba9c1a59@mail.gmail.com>
	<Pine.LNX.4.61.0704101721060.21664@yvahk01.tjqt.qr>
	<fad2fb270704100853o52810bf9k56c1cef4c93f4c8c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fad2fb270704100853o52810bf9k56c1cef4c93f4c8c@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MKS <rekordmeister@gmail.com>
Cc: netfilter@lists.netfilter.org


On Apr 10 2007 15:53, MKS wrote:
>> 
>> What exactly are you trying to achieve?
>> To simply test transmission, `ping -I interface -bf 255.255.255.255`
>> does the job.
>
> I want to generate load on the NAS by making a traffic matrix over n
> ppp connections.
> e.g. ppp0 will send traffic to ppp1-pppN, etc.

I don't think that's what ppp is for. Use bonding or bridging perhaps.


Jan
-- 

