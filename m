From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Thu, 17 Jun 2004 09:41:40 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040617164140.44194.qmail@web14724.mail.yahoo.com>
References: <2E314DE03538984BA5634F12115B3A4E8950DE@email1.mitretek.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2E314DE03538984BA5634F12115B3A4E8950DE@email1.mitretek.org>
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

<justin.piszcz@mitretek.org> wrote:
> Is it necessary to build ip_conntrack_ftp as a
> module?
> If you want to do ports other than 21 on 2.4, yes,
> on 2.6, no, you can
> use the append="" option in LILO.
> 
Could you elaborate this a bit? I use Linux kernel
2.6.5 and ip_conntrack_ftp is compiled into the
kernel. Do I still have to pass a append="" option to
kernel at LILO? 

Sagara


		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - Send 10MB messages!
http://promotions.yahoo.com/new_mail 

