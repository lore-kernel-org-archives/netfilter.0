From: varun_saa@vsnl.net
Subject: ftp issue cont.
Date: Fri, 12 Aug 2005 21:51:42 +0500
Message-ID: <6a83e1b6a8561d.6a8561d6a83e1b@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
To: netfilter@lists.netfilter.org

Make sure you've opened up whichever unprivileged passive ports your FTP 
server uses. Passive FTP connections are seen as new by stateful 
firewalls, not related to the original control connection. 
 
Derick Anderson  
 
Thanks Derick, 
              But I am not very clear about ftp. 
So I will appreciate details. 
 
Thanks 
 
Varun 


