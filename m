From: Mariusz Kruk <Kruk@epsilon.eu.org>
Subject: Re: Logging suggestions
Date: Tue, 12 Apr 2005 18:11:34 +0200
Message-ID: <20050412161134.GA5964@epsilon.rdc.pl>
References: <0aa401c53f73$5c19a2a0$09603fca@southern>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <0aa401c53f73$5c19a2a0$09603fca@southern>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Apr 12, 2005 at 08:51:54PM +0530, hareram wrote:
> I have large  capacity link like STM with my provider
> Iam planning to log the every packet, source IP , Dest IP, Src port, Dest 
> port , Type of Service
> what kind of system configuration recommended

First of all, I would advise to think if you really really need the
logging of every packet that badly. Perhaps only logging new
connections would be sufficient. Otherwise you'll generate huge amounts
of data. Especially, if your link is quite full.

-- 
/\-\/\-\/\-\/\-\/\-\/\-\/\ Irrelevant  proper  order  of words is, yes.
\  Kruk@epsilon.eu.org   / Yoda of Borg
/ http://epsilon.eu.org/ \ 
\/-/\/-/\/-/\/-/\/-/\/-/\/ 

