From: Ahmad Almulhem <feltah@yahoo.com>
Subject: ip_queue question
Date: Fri, 20 Feb 2004 01:02:49 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040220090249.97666.qmail@web13426.mail.yahoo.com>
References: <BAY15-F10Ln5U9T3TGJ00000452@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F10Ln5U9T3TGJ00000452@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,

I am trying to run 2 program to
use ip_queue module at the same time. 

I basically start the first program 
and it runs fine receiving packets 
correctly. I then run the second 
program, which prints the following 
error:

"Received error message 16"

and keeps running without receiving
any packets!

The two programs that I am running are
snort inline and my code based on the
sample which comes with libipq(3).
Both programs runs fine when run alone.
I only get this problem when I try to run
them together.

My question: does libipq module support
more than one program at one time? is
there any options I should set when
modprobe ip_queue?

thank u for ur help,

ahamd



__________________________________
Do you Yahoo!?
Yahoo! Mail SpamGuard - Read only the mail you want.
http://antispam.yahoo.com/tools

