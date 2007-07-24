From: David Ford <david@blue-labs.org>
Subject: Re: Error accepting new connection
Date: Tue, 24 Jul 2007 12:01:33 -0400
Message-ID: <46A6225D.10708@blue-labs.org>
References: <46A49E6C.70403@unipex.it> <46A505A2.6040304@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46A505A2.6040304@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@lists.netfilter.org


> Michele Petrazzo - Unipex srl wrote:
>> [..]
>> I see that on my syslog there are a ton (milions) of:
>>
>> Jul 22 11:44:51 srv syslog-ng[22054]: Error accepting new connection;
>> error='Too many open files (24)'
>>
>> But this is a "simple" server that do only nat and some other, simple,
>> tasks, and there are no programs that can open so many files.
Sometime recently syslog-ng got the grand idea to severely limit
incoming connections. Edit your syslog-ng conf and edit to something
like this:

source src { unix-stream("/dev/log" max-connections(50)); internal(); };

-david
-- 
"Millions of innocent men, women and children, since the introduction of
Christianity, have been burnt, tortured, fined, imprisoned; yet we have not
advanced one inch towards uniformity. What has been the effect of coercion?
To make half the world fools, and the other half hypocrites."
--Thomas Jefferson

This message is confidential to the Internet at large, unless otherwise
indicated or apparent from its nature. It may not be reproduced on Mars
unless it has previously been printed on Uranus. This message is directed to
the intended recipient only (usually everyone, but sometimes nobody and once
in a blue moon, just somebody), who may be readily determined by the sender
of this message and its contents. This email message (including any
attachments) is not for the sole use of the intended recipient(s) and may or
may not contain confidential, proprietary and privileged information. It may
include sarcastic holier than tho content. If the reader of this message is
not the intended recipient, or an employee or agent responsible for
delivering this message to the intended recipient: (a) any dissemination or
copying of this message is strictly prohibited unless you feel otherwise;
and (b) immediately notify the sender by return message (but only if the sun
has gone black) and destroy any copies of this message in any form
(electronic, paper or carved in stone) that you have. Please destroy by
smashing your computer with a 21lb sledge hammer approximately 17 times to
ensure destruction of your system. Any unauthorized review, use, disclosure
or distribution is most assuredly not prohibited and you will not
IMMEDIATELY be PROSECUTED to the fullest ... or emptiest ... extent of the
law. If you are not the intended recipient, please immediately notify some
random person of your age, sex, and location and your undying desire to
fornicate with them by email and destroy all copies of the original message
if you sent it to an underage person. Oh, and definitely don't tell me
about it. The delivery of this message and its information is neither
intended to be nor constitutes a disclosure or waiver of any trade secrets,
intellectual property, attorney work product, or attorney-client
communications. If you happen to be a corporation that uses
lawyer-think-speak-asinine-thoughts well then please sit your ass back down
and we will promptly ignore the hell out of you and your disclaimers. Wait,
no we won't. We have this urgent primal need to publically make fun of you,
and then we'll repost your message in blazing full frontal nudity across the
internet. The authority of the individual sending this message to legally
bind any entity is neither apparent nor implied, and must be independently
verified - uh ... duh? Isn't that obvious? Of course not. Only people with
intelligence recognize such simple facts. Thank you for standing in the back
yard and whining your ass off holding up tiny little posters forbidding
mosquitos from biting you. Does a whole hell of a lot of good. Right?
Yeah, you keep up with the delusions. Keeping up with the Jones is good
after all. Holy hell Batman sleeps with Robin -- This disclaimer is short!

