From: Scott MacKay <scottmackay@yahoo.com>
Subject: Granularity of ipq_read timeout
Date: Tue, 18 Mar 2003 11:00:01 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030318190001.94973.qmail@web13907.mail.yahoo.com>
References: <se770789.071@logistasolutions.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <se770789.071@logistasolutions.com>
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

Hello all,
I was curious, is the granularity of the ipq_read()
timeout field really down to the microsecond level?

I am running on linux (RH, but with the 2.4.20 kernel
so I could patch for bridge + iptables) and seem to be
having a problem with small timeout values.

If i use something like:

gettimeofday(&starttime,&null_tx);
status=ipq_read(qh,buffer,BUFFER_SIZE,timeout);
gettimeofday(&endtime,&null_tx);

I notice that my delta from the endtime-startime is
larger than the timeout value.  Can ipq_read()
actually timeout on the single digit microsecond
level?

-Scott



__________________________________________________
Do you Yahoo!?
Yahoo! Platinum - Watch CBS' NCAA March Madness, live on your desktop!
http://platinum.yahoo.com

