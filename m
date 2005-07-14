From: Jason Opperisano <opie@817west.com>
Subject: Re: off-toppic file too big
Date: Thu, 14 Jul 2005 18:59:26 -0400
Message-ID: <20050714225926.GA30194@bender.817west.com>
References: <2658c3fc050714121726b7af82@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <2658c3fc050714121726b7af82@mail.gmail.com>
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

On Thu, Jul 14, 2005 at 04:17:21PM -0300, Marcos Eduardo Nunes wrote:
> Hi...
> 
> I have this message at my server: "ls: store.log: Valor muito extenso
> para o tipo de dados definido total 0" ... I can't delete the file...
> what could I do???

stab in the dark:

  cat /dev/null > store.log
  rm store.log

-j

--
"Joe Swanson: You can't just come over here and annex my pool!
 Peter: Oh yeah? Well, according to paragraph 7, sentence 3, word 8 of
 the Geneva Convention..."the." So, tough luck, Swanson."
        --Family Guy


