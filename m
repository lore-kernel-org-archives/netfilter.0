From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: RE: Allow active and passive FTP connections
Date: Tue, 22 Jun 2004 08:38:23 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040622153823.69621.qmail@web14702.mail.yahoo.com>
References: <Pine.LNX.4.33.0406221011350.2546-100000@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0406221011350.2546-100000@blackhole.kfki.hu>
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

--- Jozsef Kadlecsik <kadlec@blackhole.kfki.hu> wrote:
> Currently there is no solution. When
> nfnetlink-ctnetlink is completed,
> the FTP server could be patched to notify the kernel
> on the data ports it
> wants to open or connect to, which would solve the
> problem.
> 
> As an alternative, you could use sftp instead.
> 
Now I know what caused to drop the FTP data channel
connection packets and currently there is no solution.


Thanks for all those who comment on this issue.

Kind regards
Sagara


	
		
__________________________________
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
http://promotions.yahoo.com/new_mail 

