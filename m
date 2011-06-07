From: <bmcdowell@coxhealthplans.com>
Subject: RE: [2:656]?
Date: Tue, 7 Jun 2011 12:41:11 +0000
Message-ID: <92A9C99A1E5FF14F8538DDEE14996A5203363A@chp-exg.coxhp.com>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com>
 <4DED3141.9030805@kickstone.com>
 <92A9C99A1E5FF14F8538DDEE14996A52033470@chp-exg.coxhp.com>
 <alpine.LNX.2.01.1106071101210.25037@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1106071101210.25037@frira.zrqbmnf.qr>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: jengelh@medozas.de
Cc: john.lister@kickstone.com, netfilter@vger.kernel.org

Well, to be completely fair, I didn't use '-c' for my save command.  Simply 'iptables-save > file'.



Bob McDowell
Network/Security Engineer 
Cox HealthPlans 
417.269.2848 
bmcdowell@coxhealthplans.com

Confidentiality Notice: This e-mail message (including any attachments) may contain confidential and privileged information, and is for the sole use of the intended recipient(s). Any unauthorized review, use, disclosure or distribution is strictly prohibited. If you are not the intended recipient, please notify the sender by replying to this e-mail message, permanently deleting the original message and destroying any hard copies of the original message that may have been created.


-----Original Message-----
From: Jan Engelhardt [mailto:jengelh@medozas.de] 
Sent: Tuesday, June 07, 2011 4:02 AM
To: Bob McDowell
Cc: john.lister@kickstone.com; netfilter@vger.kernel.org
Subject: RE: [2:656]?

On Monday 2011-06-06 21:59, bmcdowell@coxhealthplans.com wrote:

>> -----
>> *filter
>> :INPUT DROP [2:656]
>> -----

>Well, that explains why I couldn't search for it!  HA!

Well, it is documented right in iptables-save(8) under -c.
