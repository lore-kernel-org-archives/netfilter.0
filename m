From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 08:43:14 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040621154314.7506.qmail@web14724.mail.yahoo.com>
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
> You are *NOT* running an (SSL) FTP daemon, correct?
> (The current
> conntrack module for FTP does _NOT_ support this).
> 
You are right! I disabled SSL from the FTP server. Now
the RELATED rule *works* as I expected for both active
and passive FTP connections.

Thank you very much to highlight it to me. Is there a
workaround for this?

kind regards
Sagara




	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 

