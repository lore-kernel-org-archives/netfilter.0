From: Magnus Sundberg <Magnus.Sundberg@dican.se>
Subject: Non host resident proxies
Date: Fri, 17 Jan 2003 18:50:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E284279.9030202@dican.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dear sirs,
I have a standard firewall, almost minimal linux 
installation+netfilter+3 interfaces (internal, external and perimeter)

I want to redirect all POP3 requests back to my main server. POP3 
requests from the main server is forwarded to the internet.
Something like this.

------------          -------------------
!          !          !                 !
! Client   !--------->! router/firewall !
!          !      ----!                 !
------------      ! ->! - - - - - - - - ! ---->(Internet)
                   ! ! !                 !
                   ! ! -------------------
-------------     ! !
!           !<----- !
! Server    !--------
!           !
-------------

I can scan all pop3 traffic for viruses by this method.
I believe this setup would be correct for proxying other protocols to.
I would preferably be interested in also being able to redirect the 
protocol port too.
Is it possible to do this with the current netfilter release?
I am aware that there is good chance of unwanted loops with this setup

regards,

Magnus Sundberg






