From: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
Subject: iptables accounting problem
Date: Wed, 18 Dec 2002 15:41:42 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <18061561961.20021218154142@complexsystem.ru>
Reply-To: "ITM CS Ruslan O. Nesterov" <ruslan@complexsystem.ru>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello netfilter list,
      I'm sorry for asking this question, I red all the documentation
      and still got no clue how to make ip accounting work.
      I got a pc with 2 ethernet cards all traffics goes through it.
      i created a rule like
      iptables -N xxx.xxx.xxx.xxx
      iptables -A input -d xxx.xxx.xxx.xxx -j xxx.xxx.xxx.xxx
      when i type
      iptables -L xxx.xxx.xxx.xxx -n -v
      i get 0 traffic information. How could be? Or whereis my
      mistake?
      
      
  

-- 
Best regards,
 ITM                          mailto:ruslan@complexsystem.ru



