From: George Georgalis <georgw@galis.org>
Subject: doh! lost mail...
Date: Wed, 10 Jul 2002 14:08:14 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020710140814.A27614@trot>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Well I blew it, never ran into a problem like this before so thought I'd
share. I have lost mail. BTW - Thanks Lauren for all your help, support
and escalations on my shell account at http://he.net ...and I thought
it was your server that was stuck!

(If you run Linux/Unix) The scenario I suspect is not so uncommon. Here's
part of my procmailrc.


:0 Whc: msgid.lock
| formail -D 8192 msgid.cache
:0 a:
/dev/null

:0 Wc
| razor-check
:0 Wa
razor-caught/


In a nutshell, if the razor-check program hangs or is slow to respond,
fetchmail times out. When it runs again the message is flagged as a
duplicate per the first recipe and sent to /dev/null

So if you were wondering what happened the the message I never responded
to... I've been doing this in the background for years. :) Don't know
how long or frequently the razor-check has been overloaded. But seems
often in recent times.

// George


-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


