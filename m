From: "Contreras Verdugo, Leonardo" <lcontreras@manquehue.cl>
Subject: RV: iptables
Date: Thu, 26 Feb 2004 11:16:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5B029228151AFA499070FBEE148FCD3A4AF4EA@espino.manquehue.cl>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> hola a todos:
> 
> alguien sabe como hacer para permitir que desde internet se comunicaran a
> un solo usuario en mi red, pero sin utilizar la IP?.
> existe algo como -m mac --mac-destination XX:XX:XX:XX:XX:XX o algo que me
> sirva?.
> 
> lo que necesito es algo como:
> 
> 	target	prot	source		destination	
> 	accept	all	<internet>	<mi-equipo>	
> 
> pero para  <mi-equipo> quiero que se identifique por la MAC, que es unica,
> debido a que las IP se entregan a travez de un DHCP, por lo que la IP la
> podria tener otro equipo en algun momento. si existe alguna otra forma de
> identificar un equipo, ni por MAC ni IP, comentenlo por favor, tal vez me
> sirva.-
> 
> 				saludos.-

