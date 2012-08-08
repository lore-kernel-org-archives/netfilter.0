From: Gomathivinayagam Muthuvinayagam <sankarmail@gmail.com>
Subject: ulogd - hashtable_find function - question
Date: Wed, 8 Aug 2012 07:27:33 -0700
Message-ID: <CAAJpzgbEgy9WsLvCSkQbVpdUXWL-ivbnSEcY9zbm5M6m-kawRA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=MV31ZeI7aeR5DvlWTAQ2qnWyWxRnVdYfB+YoCHYXViE=;
        b=v/TqLqYNRuy2JAk18MR6VvjYFdpRvZXcgkw+lGSybsbdGbha22/xafNWdUh8Xtey3b
         z6TWcrOlRNomybjv9I/GB3zlOarwhpjaWqLDc4iMG7E6a7mbH1uZSHbK8Xg4yir2/Hdq
         p1GFVIwmW3JLh/LVqfs9SRY95+FAbAJKVpqaHszaqsxRGClxJffNo00ZUm4NAiNRJNF0
         FmP6iiNIGyB76oLqquCvRPJ31tXUFfhTPe3jAZKoxeoBkH7879KKPW+TQtdx2GdTcopH
         JelHCYxWV8rSundVZlLe0/PQ/YUvfvFuYZvv2cps3hn+bKnTEokbK++w4Gq0ytJb+cK7
         px9Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm going through ulogd hash.c code. I have a question on
hashtable_find function.

struct hashtable_node *
hashtable_find(const struct hashtable *table, const void *data, int id)
{
	struct llist_head *e;
	struct hashtable_node *n;

	llist_for_each(e, &table->members[id]) {
		n = llist_entry(e, struct hashtable_node, head);
		if (table->compare(n, data)) {
			return n;
		}
	}
	errno = ENOENT;
	return NULL;
}

In the above function, you are passing the id which is the hash value.
Basically it allows you to find the hashnode in the hashtable.
But why we are again calling  compare function and check the
equivalence of the values? Is the id itself not enough?

Thanks & Regards,
