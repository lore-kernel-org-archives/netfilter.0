From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 08:21:11 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040621152111.84670.qmail@web14704.mail.yahoo.com>
References: <2E314DE03538984BA5634F12115B3A4E895673@email1.mitretek.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E895673@email1.mitretek.org>
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

--- "Piszcz, Justin Michael"
<justin.piszcz@mitretek.org> wrote:
> I see..
> 
> Some questions for you:
> 
> You are running the IP connection tracker for FTP in
> the KERNEL or
> MODULE?
IP connection tracker for FTP in kernel, not as a
module.

> You are running the FTP daemon on port 21?
Yep, on the port 21

> You are *NOT* running an (SSL) FTP daemon, correct?
> (The current
> conntrack module for FTP does _NOT_ support this).
> 
really? I run a SSL based FTP daemon. 

Let me disable SSL, try and see. 

But I *really* need to use a SSL/TLS based FTP server.
Is there any workaround?

Sagara




		
__________________________________
Do you Yahoo!?
Read only the mail you want - Yahoo! Mail SpamGuard.
http://promotions.yahoo.com/new_mail 

