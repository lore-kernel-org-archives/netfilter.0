From: Don Gould <don@bowenvale.co.nz>
Subject: SMTP Redirect - 'This is it'...
Date: Sat, 05 Aug 2006 21:52:33 +1200
Message-ID: <44D46A61.10606@bowenvale.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Is there a way to fool the mail client into thinking that a call to 
'smtp.someonelse.whateva.com' is my local server?

I have people visiting my network with laptops.

Getting mail off their POP server is no problem.

Sending mail is a problem as my up stream provider blocks links....

So I want my server on my network to intercept the call on port 25 for a 
remote smtp server and then just lie to the laptop.

This gives me the advantage of not having to reconfigure the users 
machine when they leave my network.

Cheers Don
-- 
Don Gould
www.thinkdesignprint.co.nz - www.tcn.bowenvale.co.nz - 
www.bowenvale.co.nz - www.hearingbooks.co.nz - SkypeMe:  ThinkDesignPrint


