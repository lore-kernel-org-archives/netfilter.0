From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Mon, 21 Jun 2004 20:10:15 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040622031015.82208.qmail@web14712.mail.yahoo.com>
References: <2E314DE03538984BA5634F12115B3A4E8956F2@email1.mitretek.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E8956F2@email1.mitretek.org>
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
Cc: kadlec@blackhole.kfki.hu

--- "Piszcz, Justin Michael"
<justin.piszcz@mitretek.org> wrote:
> If you find one (that works with TLS/SSL), please
> let me know :)
> Sorry I have not seen one as of yet.
> 
I wonder is it an issue with the conntrack module or
the FTP server. May be Jozsef Kadlecsik could shed
some light on this. 

If the FTP server side has to be fixed, I could take
it up with the FTP server folks.

kind regards
Sagara

> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On
> Behalf Of Sagara
> Wijetunga
> Sent: Monday, June 21, 2004 11:43 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: Allow active and passive FTP
> connections
> 
> --- "Piszcz, Justin Michael"
> <justin.piszcz@mitretek.org> wrote:
> > You are *NOT* running an (SSL) FTP daemon,
> correct?
> > (The current
> > conntrack module for FTP does _NOT_ support this).
> > 
> You are right! I disabled SSL from the FTP server.
> Now
> the RELATED rule *works* as I expected for both
> active
> and passive FTP connections.
> 
> Thank you very much to highlight it to me. Is there
> a
> workaround for this?
> 
> kind regards
> Sagara
> 
> 
> 
> 
> 	
> 		
> __________________________________
> Do you Yahoo!?
> New and Improved Yahoo! Mail - 100MB free storage!
> http://promotions.yahoo.com/new_mail 
> 
> 
> 
> 
> 



		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail

